class ProfileController < ApplicationController
  def create
    @profile = current_user.profile.build(profile_params)
    flash[:alert] = 'Your profile has failed to save' unless @profile.save
    redirect_to user_path(current_user)
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :picture)
  end
end
