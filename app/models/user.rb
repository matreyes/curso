# coding: UTF-8

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  passport               :string(255)
#  name                   :string(255)
#  surname                :string(255)
#  tutor_id               :integer
#  is_admin               :boolean         default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#  current_level          :integer         default(0)
#  avatar                 :string(255)
#  checked_at             :datetime
#  version                :integer
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#

require 'open-uri'
require 'csv'

class User < ActiveRecord::Base

  CSV_URL = "https://docs.google.com/spreadsheet/" +
  "pub?hl=es&hl=es&key=0Apc-qBdqkJwVdGJMUXpRYS00RTdZZVU3cTN0VWc2YVE&single=true&gid=0&output=csv"


  has_many :participants, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :tutor, class_name: 'User'
  validates_presence_of :passport, :name, :surname
  validates_uniqueness_of :passport, :email

  scope :with_avatar, where("avatar IS NOT NULL")
  scope :participant, where(is_admin: false)
  scope :search, lambda { |q|
    conditions = []
    conditions << "name like '%#{q}%'"
    conditions << "surname like '%#{q}%'"
    conditions << "email like '%#{q}%'"
    conditions << "passport like '%#{q}%'"
    where('(' + conditions.join(" OR ") + ')')
  }

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :current_level, :tutor_id, :passport, :name, :surname, :avatar

  before_validation :check_passport_number

  # will_paginate
  self.per_page = 20

  def to_s
    name+" "+surname
  end
  
  #surname first
  def complete_name
    [surname, name].compact.join(", ")
  end

  def passport=(p)
    p = p.tr ".", ""
    p = p.upcase
    super p
  end

  def set_current_level(level)
    if level == current_level+1
      self.update_attributes(current_level: level)
    end
  end

  def self.versions
    select(:version).all.map(&:version).uniq.compact
  end

  private

  def check_passport_number
    return unless new_record?

    # Test environment
    if Rails.env.test?
      if self.passport.to_s == '12345678-0'
        self.tutor_id = 1
        self.is_admin = false
      elsif self.passport.to_s == '897654321-0'
        self.tutor_id = nil
        self.is_admin = true
      end
      self.version = VERSION
      return true
    end

    found = false
    CSV.read(Rails.root.join("csv", "alumnos.csv")).each do |row|
      if row[0] == self.passport.to_s
        found = true
        self.tutor_id = row[1]
        self.is_admin = row[2] == '1' ? true : false
        self.version = row[3].to_i
      end
    end
    unless found
      errors.add(:passport, "no se encuentra registrado.")
    end
  end
end
