class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to new_user_session_path unless ['devise/sessions', 'users/registrations'].include?(params[:controller]) || current_user
  end
end
