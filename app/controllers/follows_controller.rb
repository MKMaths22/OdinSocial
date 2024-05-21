class FollowsController < ApplicationController
  def create
    @follow = Follow.new(followee: current_user)
    @followrequest = FollowRequest.find_by(requestee: current_user, requester_id: params[:follow][:follower_id])
    if @followrequest && @follow.update!(allowed_follow_params)
      flash[:notice] = "You are now being followed by #{@follow.follower.name}."
      @followrequest.destroy
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
    params.require(:follow).permit(:follower_id)
  end
end
