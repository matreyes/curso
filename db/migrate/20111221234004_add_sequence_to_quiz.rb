class AddSequenceToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :sequence, :integer
  end
end
