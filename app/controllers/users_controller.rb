class UsersController < ApplicationController

  def index
    @users = User.not_friend_of(current_user)
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_url(current_user), notice: "You have updated your profile." }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:username, :picture)
  end
end