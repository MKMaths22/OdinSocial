require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  setup do
    @user = User.first
    sign_in @user
    @post = Post.first
    @other_post = Post.where.not(author: @user).first
  end

  test "Adding a like" do
    visit post_url(@post)
    # in fixtures, the signed-in user is :peter. He wrote the post @post, which already has a like from :chris but not from :peter
    assert_text "Delete Like", count: 0
    post_id = @post.id
    user_id = @user.id
    page.assert_selector(:css, "a[href='/likes?like%5Bliked_post_id%5D=#{post_id}&like%5Bliker_id%5D=#{user_id}']")
    click_on "Like this!"
    assert_text "Delete Like", count: 1
  end

  test "Removing a like" do
    visit post_url(@other_post)
    assert_text "Delete Like", count: 1
    @like = Like.where(liker: @user, liked_post: @other_post).first
    like_id = @like.id
    page.assert_selector(:css, "a[href='/likes/#{like_id}']")
    click_on "Delete Like"
    assert_text "Like this!", count: 1
    assert_text "Delete Like", count: 0
  end

end