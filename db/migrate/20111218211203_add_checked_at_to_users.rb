class AddCheckedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :checked_at, :datetime
  end
end
