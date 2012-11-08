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
  belongs_to :user
  
  validates :answer, :presence => true
  delegate :sequence, to: :quiz
  
  scope :answered_by, lambda { |p| where(user_id: p.id).order("updated_at DESC") }
  
end
