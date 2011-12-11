class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :abstract
      t.integer :position

      t.timestamps
    end
  end
end
