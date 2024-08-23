require "test_helper"

class UserMailerTest < ActionMailer::TestCase

  def setup
    @user = User.first
    @url = 'http://odinbook.com/login'
  end

  test "welcome" do
    email = UserMailer.with(user: User.first).welcome_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ["notifications@odinbook.com"], email.from
    assert_equal [User.first.email], email.to
    assert_equal "Welcome to OdinBook", email.subject
    
    mail_body = ERB.new(File.read('app/views/user_mailer/welcome_email.text.erb')).result(binding)

    assert_equal mail_body.strip, email.text_part.body.to_s.strip
  end
end