require "test_helper"

class SignUpTest < ActionDispatch::SystemTestCase
  
  include ActionMailer::TestHelper

  driven_by :selenium, using: :headless_chrome

  test "should send confirmation email" do
    visit new_user_registration_url
    fill_in "Name", with: "Barry"
    fill_in "Email", with: "barry@gmail.com"
    fill_in "Password", with: "abcdef"
    fill_in "Password confirmation", with: "abcdef"
    click_on "Sign up"
    assert_text "Welcome! You have signed up successfully."
    email = UserMailer.with(user: User.last).welcome_email
    # detects the welcome email but not the confirmation email, why is this?
    assert_emails 1
        # UserMailer.with(to: 'barry@gmail.com'), :welcome_email do
        # email.deliver_later
    # end
  end
end