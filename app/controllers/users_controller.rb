class UsersController < ApplicationController

  def index
    @users = User.not_friend_of(current_user)
  end

  def show
    @user = User.find(params[:id])
  end

end