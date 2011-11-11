class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :quiz_id
      t.integer :user_id
      t.text :answer
      
      t.timestamps
    end
  end
end
