class AddsPendingToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :pending, :boolean
  end
end
