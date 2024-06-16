require "test_helper"

class FollowTest < ActiveSupport::TestCase
  
  test "should not save a duplicate follow" do
    follow = Follow.new(follower: Follow.first.follower, followee: Follow.first.followee)
    assert_not follow.save, "Saved a duplicated follow"
  end

  test "should save a follow with duplicate follower but different followee" do
    # test depends on fixtures follows.yml and users.yml, that only existing follow is peter following chris, with ste as another user
    follow = Follow.new(follower: users(:peter), followee: users(:ste))
    assert follow.save, "Failed to save a follow with duplicated follower but different followee"
  end

  test "should save a follow with duplicated followee but different follower" do
    # test depends on fixtures follows.yml and users.yml, that only existing follow is peter following chris, with ste as another user
    follow = Follow.new(follower: users(:ste), followee: users(:chris))
    assert follow.save, "Failed to save a follow with duplicated followee but different follower"
  end
end
