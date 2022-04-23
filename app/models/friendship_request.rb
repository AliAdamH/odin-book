class FriendshipRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :addressee, class_name: 'User'
  validates :requester, uniqueness: { scope: :addressee }

  enum status: {
    pending: 0,
    accepted: 1
  }
end
