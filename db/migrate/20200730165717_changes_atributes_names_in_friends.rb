class ChangesAtributesNamesInFriends < ActiveRecord::Migration[6.0]
  def change
    rename_column :friends, :follower_id, :user1_id
    rename_column :friends, :leader_id, :user2_id
  end
end
