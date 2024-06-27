require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @user = User.first
    @post = Post.first
    # this depends on the first post in posts.yml having at least one comment by the first user in users.yml
    @user_comment = Comment.where(post: @post).where(author: User.first).first
    # we will sign in users(:peter) = User.first in users.yml
    sign_in @user
  end

  test "Creating a comment" do
    visit post_url(@post)
    stringy = @post.id
    page.assert_selector(:css, 'a[href="/comments/new?post_id=#{stringy}"]')
  end

  test "Should not show links for editing or deleting comment that user did not author" do

  end

  test "Should delete a comment when the signed in user wrote the comment" do

  end
end