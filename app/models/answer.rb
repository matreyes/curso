# == Schema Information
#
# Table name: answers
#
#  id         :integer         not null, primary key
#  quiz_id    :integer
#  user_id    :integer
#  answer     :text
#  created_at :datetime
#  updated_at :datetime
#

class Answer < ActiveRecord::Base
  belongs_to :quiz
  
  validates :answer, :presence => true  
  
end
