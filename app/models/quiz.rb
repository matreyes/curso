# == Schema Information
#
# Table name: quizzes
#
#  id               :integer         not null, primary key
#  level_id         :integer
#  question         :text
#  created_at       :datetime
#  updated_at       :datetime
#  instant_feedback :text
#

class Quiz < ActiveRecord::Base
  has_one :level
  has_many :answers
  
  scope :next, lambda { |p| {:conditions => ["sequence > ?", p.sequence], :limit => 1, :order => "sequence"} }
  
  def resolved(user)
    if self.answers.where(user_id: user).empty? 
      true
    else
      false
    end
  end

end
