class AddInstantFeedbackToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :instant_feedback, :text
  end
end
