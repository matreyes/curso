class AddSequenceToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :sequence, :integer
  end
end
