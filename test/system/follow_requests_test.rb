require "application_system_test_case"

class FollowRequestsTest < ApplicationSystemTestCase
  setup do
    @peter = User.find_by(name: 'Peter')
    @chris = User.find_by(name: 'Chris')
    @ste = User.find_by(name: 'Ste')
  end

  # These tests depend on the fixtures users.yml, follows.yml and follow_requests.yml. In particular, the only follow initially is Peter following Chris and the only follow request is Chris requesting to follow Peter.

  test "Declining a follow request" do
    sign_in @peter
    visit 'users/registrations'
    click_on "Decline"
  end

  test "Accepting a follow request" do

  end

  test "Withdrawing a follow request" do

  end

  test "Creating a follow request" do

  end


end