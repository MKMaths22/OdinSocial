class LikesController < ApplicationController
  def create
    # current_post_id must be supplied for create method.
    current_post = Post.where(id: current_post_id).first
    return unless current_post
    @like = Like.new(liker: current_user, liked_post: current_post)
  end

  def destroy
    @like = Like.find(params[:id])
    if current_user != @like.liker
      flash.now[:alert] = 'You may only delete your own likes. Permission denied.'
      redirect_to root_path
    else
      @like.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end
