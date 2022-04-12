class AddStatusToFriendshipRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :friendship_requests, :status, :integer, default: 0
  end
end
