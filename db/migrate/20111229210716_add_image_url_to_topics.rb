class AddImageUrlToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :image_url, :string
  end
end
