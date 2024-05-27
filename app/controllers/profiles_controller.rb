class ProfilesController < ApplicationController
  def create
  end

  def update
  end

  def edit
  end

  private

  def allowed_profile_params
    params.require(:profile).permit(:picture)
  end
end
