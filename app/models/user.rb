class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendship_requests, foreign_key: :requester_id
  has_many :to_accept_requests, foreign_key: :addressee_id, class_name: 'FriendshipRequest'
end
