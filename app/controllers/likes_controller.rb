class LikesController < ApplicationController
  def create
   @like = current_user.likes.build(like_params)

   if @like.save
	flash[:notice] = 'Successfully liked the post '
	redirect_back fallback_location: authenticated_root_path
   else
        flash.now[:alert] = 'Could not like the post'
	render 'posts/index'
   end
  
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_back fallback_location: authenticated_root_path
  end


  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
