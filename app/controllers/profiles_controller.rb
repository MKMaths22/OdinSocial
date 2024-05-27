class ProfilesController < ApplicationController
  def create
  end

  def update
  end

  def edit
  end

  private

  def allowed_profile_params
    params.require(:profile).permit(:picture, :body, :field_name_one, :field_content_one, :field_name_two, :field_content_two, :field_name_three, :field_content_three)
  end
end
