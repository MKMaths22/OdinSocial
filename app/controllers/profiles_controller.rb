class ProfilesController < ApplicationController
  def create
  end

  def update
    @profile = Profile.find(params[:id])
    if current_user != @profile.user
      flash.now[:alert] = "Users may only edit their own profiles. Permission denied."
      redirect_to root_path
      return
    end
    if @profile.update!(allowed_profile_params)
      flash[:notice] = "Profile information updated successfully."
      redirect_to "users/registrations/#{@profile.user.id}"
    else
      flash[:alert] = "Update failed."
      render edit_profile_path(id: @profile.id), status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def allowed_profile_params
    params.require(:profile).permit(:picture, :body, :field_name_one, :field_content_one, :field_name_two, :field_content_two, :field_name_three, :field_content_three)
  end
end
