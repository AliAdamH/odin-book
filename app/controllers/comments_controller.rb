class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    unless @comment.save
      flash[:alert] = 'Failed to register comment'
    end

    redirect_back fallback_location: post_path(params[:post_id])
  end


  private
  
  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
