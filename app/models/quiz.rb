class Quiz < ActiveRecord::Base
  has_one :level
  has_many :answers
  
  default_scope order('id ASC')

  
end
