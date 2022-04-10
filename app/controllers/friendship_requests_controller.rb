class FriendshipRequestsController < ApplicationController


  def create
    @request = current_user.friendship_requests.build(friendship_request_params)

    if @request.save
      flash[:notice] = "Your request have been successfully sent"
      redirect_back fallback_location: root_path
    else
      flash.now[:alert] = "Your request has failed"
      render 'users/index'
    end
  end

  private

  def friendship_request_params
    params.permit(:addressee_id)
  end

end