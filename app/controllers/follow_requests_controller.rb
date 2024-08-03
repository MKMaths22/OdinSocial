class FollowRequestsController < ApplicationController
  def create
    @followrequest = FollowRequest.new(requester: current_user)
    if @followrequest.update!(allowed_follow_request_params)
      flash[:notice] = "You have made a request to follow #{@followrequest.requestee.name}."
    else
      flash[:alert] = 'Error: Follow request could not be created.'
    end
    redirect_back(fallback_location: users_registrations_path)
  end

  def destroy
    @followrequest = FollowRequest.find(params[:id])
    if @followrequest.requester == current_user
      other_user = @followrequest.requestee
      @followrequest.destroy
      flash[:notice] = "You have withdrawn your request to follow #{other_user.name}."
      redirect_back(fallback_location: users_registrations_path)
    elsif @followrequest.requestee == current_user
      @followrequest.destroy
      redirect_back(fallback_location: users_registrations_path)
    else
      flash.now[:alert] = 'Permission denied, you may only delete a follow request in which you are either the requestee or the requester.'
    end
  end

  private

  def allowed_follow_request_params
    params.require(:follow_request).permit(:requestee_id)
  end
end
