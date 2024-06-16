require "test_helper"

class LikeTest < ActiveSupport::TestCase
  
  test "should not save a like with duplicated liker and liked_post" do
    like = Like.new(liker: Like.first.liker, liked_post: Like.first.liked_post)
    assert_not like.save, "saved a like with duplicated liker and liked_post"
  end

  test "should save a like with duplicated liker but different liked_post" do
  # test depends on only like in likes.yml being liker = chris and liked_post = first_post. second_post is another post
    like = Like.new(liker: users(:chris), liked_post: posts(:second_post))
    assert like.save, "failed to save a like with duplicated liker but different liked_post"
  end

  test "should save a like with duplicated liked_post but different liker" do
    # test depends on only like in likes.yml being liker = chris and liked_post = first_post. peter is another user
    like = Like.new(liker: users(:peter), liked_post: posts(:first_post))
    assert like.save, "failed to save a like with duplicated liked_post but different liker"
  end
end
