class LikesController < ApplicationController
  def create
    @like = Like.new(allowed_like_params)
    if @like.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Like failed.'
      redirect_back(fallback_location: root_path, status: :unprocessable_entity)
    end
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

  private

  def allowed_like_params
    params.require(:like).permit(:liked_post_id, :liker_id)
  end
end
