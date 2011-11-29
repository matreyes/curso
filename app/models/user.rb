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

class User < ActiveRecord::Base
  
  has_many :participants, class_name: 'User'
  belongs_to :tutor, class_name: 'User'
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :current_level, :tutor_id, :passport, :name, :surname
    
  def set_current_level(level)                                                                         
    if level == current_level+1 
      self.update_attributes(current_level: level)
    end
    
  end
  
  
end
