class AddDefaultToCurrentLevelUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :current_level
      t.integer :current_level, :default => 1
    end
  end
end
