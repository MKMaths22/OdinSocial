class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new(author: current_user )
  end
  
  def create
    @comment = Comment.new(author: current_user )
    if @comment.update!(allowed_comment_params)
      flash[:notice] = 'Comment added successfully.'
      redirect_back(fallback_location: root_path)
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
      @old_id = @comment.id
      @comment.destroy
      # flash.now[:notice] = 'Comment deleted successfully.'
      # redirect_back(fallback_location: root_path)
      # render 'comments/destroy'
      # redirect_to '/comments/destroy'
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  private

  def allowed_comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
