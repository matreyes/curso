class RemoveUserIdFromQuizzes < ActiveRecord::Migration
  def change
    remove_column :quizzes, :user_id
  end
end
