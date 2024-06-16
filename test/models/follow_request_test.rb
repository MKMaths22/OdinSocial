require "test_helper"

class FollowRequestTest < ActiveSupport::TestCase
  test "should not save a duplicate follow request" do
    request = FollowRequest.new(requester: FollowRequest.first.requester, requestee: FollowRequest.first.requestee)
    assert_not request.save, "Saved a duplicated follow request"
  end

  test "should save a follow request with duplicate requester but different requestee" do
    # test depends on fixtures follow_requests.yml and users.yml, that only existing follow request is chris requesting to follow peter, with ste as another user
    request = FollowRequest.new(requester: User.find_by(name: 'Chris'), requestee: User.find_by(name: 'Ste'))
    assert request.save, "Failed to save a follow request with duplicated requester but different requestee"
  end

  test "should save a follow request with duplicated requestee but different requester" do
    # test depends on fixtures follow_requests.yml and users.yml, that only existing follow request is chris requesting to follow peter, with ste as another user
    request = FollowRequest.new(requester: User.find_by(name: 'Ste'), requestee: User.find_by(name: 'Peter'))
    assert request.save, "Failed to save a follow request with duplicated requestee but different requester"
  end
end
