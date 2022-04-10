class CreateFriendshipRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friendship_requests do |t|
      t.integer :requester_id
      t.integer :addressee_id
      t.timestamps
    end
  end
end
