# == Schema Information
#
# Table name: levels
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  tag        :string(255)
#

class Level < ActiveRecord::Base
  has_many  :quizzes, :order => "sequence ASC"
  validates_presence_of :tag, :name
   
  scope :next, lambda { |p| {:conditions => ["sequence > ?", p.sequence], :limit => 1, :order => "sequence"} }
   
end
