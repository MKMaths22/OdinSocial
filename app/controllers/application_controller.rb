class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    unless params[:controller] == 'devise/sessions'
      redirect_to new_user_session_path unless current_user
    end
  end
end
