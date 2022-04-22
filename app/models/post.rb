class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments


  def self.timeline(user)

    where(user_id: [user.friends.ids, user.id].flatten)
      .order('created_at DESC')
      .includes(:user)
  end
end
