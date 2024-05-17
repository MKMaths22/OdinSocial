class FollowsController < ApplicationController
  def create
    @follow = Follow.new(follower: current_user)
    if @follow.update!(allowed_follow_params)
      flash[:notice] = "You are now following #{@follow.followee.name}."
    else
      flash[:alert] = 'Error: Follow could not be created.'
    end
    redirect_back(fallback_location: users_registrations_path)
  end

  def destroy
    @follow = Follow.find(params[:id])
    if current_user == @follow.follower
      other_user = @follow.followee
      @follow.destroy
      flash[:notice] = "You are no longer following #{other_user.name}."
      redirect_back(fallback_location: users_registrations_path)
    else
      flash.now[:alert] = 'Permission denied, you may only delete a follow in which you are the follower.'
    end
  end

  private

  def allowed_follow_params
    params.require(:follow).permit(:followee)
  end
end
