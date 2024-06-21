require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = Post.first
    @other_post = posts(:second_post)
    @user = User.first
    sign_in @user
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "My Recent Authored Posts"
  end

  test "should create post" do
    visit posts_url
    click_on "Create Post"

    click_on "Submit"

    assert_text "Post was successfully created."
    click_on "Home"
  end

  test "should update Post when signed in user authored the Post" do
    visit post_url(@post)
    # works because posts(:first_post) has author = users(:peter) in fixtures
    click_on "Edit Post", match: :first

    click_on "Submit"

    assert_text "Post updated successfully."
    click_on "Home"
  end

  test "should not show links to update or delete Post when post not authored by signed in user" do
    visit post_url(@other_post)
    # works because posts(:second_post) has author = users(:chris) om fixtures
    assert_selector "a", text: "Edit Post", count: 0
    # the link should not exist
    assert_selector "a", text: "Delete Post", count: 0
    click_on "Home"
  end

  test "should destroy Post when signed in user authored the Post" do
    visit post_url(@post)
    number = @post.id
    click_on "Delete Post", match: :first

    assert_text "Post number #{number} deleted successfully."
  end
end
