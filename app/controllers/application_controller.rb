class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to new_user_session_path unless params[:controller] == 'devise/sessions' || current_user
  end
end
