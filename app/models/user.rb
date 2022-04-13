class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :friendship_requests, foreign_key: :requester_id
  has_many :to_accept_requests, foreign_key: :addressee_id, class_name: 'FriendshipRequest'
  has_many :posts
  has_many :likes
  has_many :comments
  has_one :profile
  
  has_many :friendships
  has_many :friends, through: :friendships


  def self.not_friend_of(user)
    where('id NOT IN (?)', user.friends.ids)
  end
end
