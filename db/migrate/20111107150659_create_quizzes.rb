class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :level_id
      t.integer :user_id
      t.text :response

      t.timestamps
    end
  end
end
