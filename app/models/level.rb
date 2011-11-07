class Level < ActiveRecord::Base
  has_many  :quizzes
  
  def name_partial
    name.downcase
  end
  
end
