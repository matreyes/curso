class AddSubtitleToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :subtitle, :text
  end
end
