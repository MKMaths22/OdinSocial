require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @user = User.first
    @post = Post.first
    @second_post = posts(:second_post)
    # this depends on the first post in posts.yml having at least one comment by the first user in users.yml and in fixtures the :second_post has only one comment, which is by another user
    @user_comment = Comment.where(post: @post).where(author: User.first).first
    # we will sign in users(:peter) = User.first in users.yml
    sign_in @user
  end

  test "Creating a comment" do
    visit post_url(@post)
    stringy = @post.id
    page.assert_selector(:css, "a[href='/comments/new?post_id=#{stringy}']")
    click_on "Add Comment"
    fill_in "Comment:", with: "Howdy, we are testing a new comment!"
    click_on "Submit"
    assert_text "Howdy, we are testing a new comment!"
  end

  test "Should not show links for editing or deleting comment that user did not author" do
    visit post_url(@second_post)
    assert_text "Edit Comment", count: 0
    assert_text "Delete Comment", count: 0
  end

  test "Should delete a comment when the signed in user wrote the comment" do
    visit post_url(@post)
    assert_current_path("/posts/#{@post.id}")
    assert_text "Comment body on post one", count: 1
    click_on "Delete Comment"
    assert_current_path("/posts/#{@post.id}")
    assert_text "Comment body on post one", count: 0
  end
end