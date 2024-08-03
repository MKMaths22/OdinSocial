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
    assert_text "You have declined the follow request from Chris."
    assert_text "You have no incoming Follow requests."
    sign_in @chris
    visit 'users/registrations'
    assert_text "You are not currently following anyone."
  end

  test "Accepting a follow request" do
    sign_in @peter
    visit 'users/registrations'
    click_on "Accept"
    assert_text "You are now being followed by Chris."
    sign_in @chris
    visit 'users/registrations'
    assert_text 'Unfollow'
  end

  test "Withdrawing a follow request" do
    sign_in @chris
    visit 'users/registrations'
    click_on 'Cancel Request'
    assert_text 'You have withdrawn your request to follow Peter.'
    sign_in @peter
    visit 'users/registrations'
    assert_text 'You have no incoming Follow requests.'
  end

  test "Creating a follow request" do
    sign_in @ste
    visit 'users/registrations'
    assert_text 'You currently have no outgoing Follow requests.'
    click_on 'Request to follow Chris'
    assert_text 'You have made a request to follow Chris.'
    sign_in @chris
    visit 'users/registrations'
    assert_text 'Decline'
    assert_text 'You have no incoming Follow requests.', count: 0
  end
end