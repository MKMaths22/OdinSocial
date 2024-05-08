class CommentsController < ApplicationController
  def new
    @comment = Comment.new(author: current_user )
  end
  
  def create
    @comment = Comment.new(author: current_user )
    if @comment.update!(allowed_comment_params)
    redirect_back(fallback_location: root_path)
    # redirect_to post_path(id: @comment.post_id)
    # redirect_to root_path
    else
      flash.now[:alert] = 'Comment failed to save.'
      render new_comment_path, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if current_user != @comment.author
      flash.now[:alert] = 'Update failed. You may only edit your own comments.'
      redirect_to root_path, status: :unprocessable_entity
      return
    end
    if @comment.update!(allowed_comment_params)
      flash[:notice] = 'Comment updated successfully.'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'Update failed.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user != @comment.author
      flash.now[:alert] = 'Delete failed. You may only delete your own comments.'
      redirect_to root_path
    else
      @comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def allowed_comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
