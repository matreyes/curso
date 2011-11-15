class Level < ActiveRecord::Base
  has_many  :quizzes
  validates_presence_of :tag, :name
   
  scope :next, lambda { |p| {:conditions => ["id > ?", p.id], :limit => 1, :order => "id"} }
   
end
