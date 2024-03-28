class PostsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @posts = Post.all
  end

  private

  def authenticate_user
    redirect_to new_user_session_path unless current_user
  end
end
