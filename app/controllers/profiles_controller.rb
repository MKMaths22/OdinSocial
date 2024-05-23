class ProfilesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def allowed_profile_params
    params.require(:profile).permit(:picture)
  end
end
