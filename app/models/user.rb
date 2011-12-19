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
#  current_level          :integer
#  created_at             :datetime
#  updated_at             :datetime
#

require 'open-uri'
require 'csv'

class User < ActiveRecord::Base
  
  CSV_URL = "https://docs.google.com/spreadsheet/" + 
  "pub?hl=es&hl=es&key=0Apc-qBdqkJwVdGJMUXpRYS00RTdZZVU3cTN0VWc2YVE&single=true&gid=0&output=csv"
    

  has_many :participants, class_name: 'User'
  belongs_to :tutor, class_name: 'User'
  
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
    [surname, name].compact.join(", ")
  end
  
  def set_current_level(level)                                                                         
    if level == current_level+1 
      self.update_attributes(current_level: level)
    end
  end
  
  private
  
  def check_passport_number
    return unless new_record?
    
    found = false
    read_csv.each do |row|
      if row[0] == self.passport.to_s
        found = true
        self.tutor_id = row[1]
        self.is_admin = row[2] == '1' ? true : false
      end
    end
    unless found
      errors.add(:passport, "no se encuentra registrado.")
    end
  end
  
  def read_csv
    data = []
    begin
      open(CSV_URL) do |f|
        data = CSV.parse(f)
      end
    rescue IOError => e
    end
    return data
  end
end
