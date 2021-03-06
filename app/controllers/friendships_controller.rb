class FriendshipsController < ApplicationController

  def create

    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])

    @reciprocal = Friendship.new(user_id: params[:friend_id], friend_id: current_user.id)

    if @friendship.save and @reciprocal.save
      FriendshipRequest.find(params[:request_id]).accepted!
      flash[:notice] = "Success ! "
      redirect_back fallback_location: authenticated_root_path
    else
      flash.now[:alert] = "Failure to befriend user "
      render 'posts/index'
    end
  end
end