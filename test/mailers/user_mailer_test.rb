require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  
  # def setup
  #  @user = users(:unconfirmed)
  # end

  test "welcome" do
    email = UserMailer.with(user: User.first).welcome_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ["notifications@odinbook.com"], email.from
    assert_equal ["peter@gmail.com"], email.to
    assert_equal "Welcome to OdinBook", email.subject
    assert_equal read_fixture("welcome").join, email.html_part.body.to_s
    assert_equal read_fixture("welcome_text").join, email.text_part.body.to_s
  end

end