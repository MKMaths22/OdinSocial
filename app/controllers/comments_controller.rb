class CommentsController < ApplicationController
  def new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user != comment.author
      flash.now[:alert] = 'Delete failed. You may only delete your own comments.'
      redirect_to root_path
    else
      @comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end
