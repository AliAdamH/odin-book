class AddIndexToFriendshipRequests < ActiveRecord::Migration[6.1]
  def change
    add_index :friendship_requests, [:requester_id, :addressee_id], unique: true
  end
end
