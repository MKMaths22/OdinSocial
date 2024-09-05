class PostsController < ApplicationController
  
  def index
    @followee_posts = Post.where(author: current_user.followees).includes(:likes, :comments).take(10)
    @current_user_posts = current_user.authored_posts.includes(:likes, :comments).take(10)
    @text_limit = ENV["TEXT_LIMIT"].to_i
  end

  def show
    @post = Post.where(id: params[:id]).includes(:likes, :comments).first
    @text_limit = 0
  end

  def new
    @post = Post.new(author: current_user)
  end

  def create
    @post = Post.new(author: current_user)
    # This assumes current_user is not being submitted with the form.
    if @post.update!(allowed_post_params)
      flash[:notice] = "Post was successfully created."
      redirect_to post_path(id: @post.id)
    else
      render new_post_path, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    # edit button should be greyed out or not appear at all in the view if current_user is not author,
    # but malicious users could bypass this
  end

  def update
    @post = Post.find(params[:id])
    if current_user != @post.author
      flash.now[:alert] = "Users may only edit their own posts. Permission denied."
      redirect_to post_path(id: @post.id)
      return
    end
    @post = Post.find(params[:id])
    if @post.update!(allowed_post_params)
      flash[:notice] = "Post updated successfully."
      redirect_to post_path(id: @post.id)
    else
      flash[:alert] = "Update failed."
      render edit_post_path(id: @post.id), status: :unprocessable_entity
    end
  end

  def destroy
    # Delete button should be greyed out or not appear at all in the view if current_user is not author,
    # but malicious users could bypass this
    @post = Post.find(params[:id])
    if @post.author == current_user
      @post.destroy
      flash[:notice] = "Post number #{params[:id]} deleted successfully."
      redirect_to posts_path
    else
      flash.now[:alert] = "Users may only delete their own posts. Permission denied."
      redirect_to root_path
    end
  end
  
  private

  def allowed_post_params
    params.require(:post).permit(:body, :title)
  end
end