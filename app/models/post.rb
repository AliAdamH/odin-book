class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :body, presence: true

  def self.timeline(user)

    where(user_id: [user.friends.ids, user.id].flatten)
      .order('created_at DESC')
      .includes(:user)
  end
end
