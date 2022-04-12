class FriendshipRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :addressee, class_name: 'User'

  enum status: {
    pending: 0,
    accepted: 1
  }
end
