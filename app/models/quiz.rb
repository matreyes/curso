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
  
  scope :next, lambda { |p| {:conditions => ["id > ?", p.id], :limit => 1, :order => "id"} }

end
