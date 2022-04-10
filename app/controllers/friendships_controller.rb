class FriendshipsController < ApplicationController

  def create

    @friendship = Friendship.new(
      user_id: current_user.id
      friend_id: params[:friend_id]
    )

    if @friendship.save
      flash[:notice] = "Success ! "
      redirect_back fallback_location: root_path
    else
      flash.now[:alert] = "Failure to befriend user "
      render 'posts/index'
    end
  end
end