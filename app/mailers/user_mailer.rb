class UserMailer < ApplicationMailer
  default from: 'notifications@odinbook.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://odinbook.com/login'
    mail(to: @user.email, subject: 'Welcome to OdinBook')
  end
end
