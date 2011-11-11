class ChangeQuizzesColumns < ActiveRecord::Migration
  change_table :quizzes do |t|
    t.rename :response, :question
  end
end
