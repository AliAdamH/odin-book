class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  
  has_many :friendship_requests, foreign_key: :requester_id
  has_many :to_accept_requests, foreign_key: :addressee_id, class_name: 'FriendshipRequest'
  has_many :posts
  has_many :likes
  has_many :comments
  mount_uploader :picture, PictureUploader
  has_many :friendships
  has_many :friends, through: :friendships
  
  after_create :send_success_email

  def send_success_email
    UserMailer.with(user: self).success_email.deliver_later
  end

  def self.not_friend_of(user)
    excluded_requesters = user.to_accept_requests.pluck(:requester_id)
    excluded_addressees = user.friendship_requests.pluck(:addressee_id)
    excluded_friends = [user.id, user.friends.ids].flatten
    excluded = (excluded_requesters + excluded_addressees + excluded_friends).uniq
    where.not(id: excluded)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
