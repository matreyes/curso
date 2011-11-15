class Answer < ActiveRecord::Base
  belongs_to :quiz
  
  
  def next_quiz
    Quiz.where("id < ?", self.quiz_id).order('id DESC').first
  end

  def previous_quiz
    Quiz.where("id > ?", self.quiz_id).order('id ASC').first
  end
  
  
end
