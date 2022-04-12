class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    flash[:alert] = 'Your profile has failed to save' unless @profile.save
    redirect_to user_path(current_user)
  end

  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :last_name, :picture)
  end
end
