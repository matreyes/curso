class AddTagToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :tag, :string
  end
end
