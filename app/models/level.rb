class Level < ActiveRecord::Base
  has_many  :quizzes
  validates_presence_of :tag, :name
   
end
