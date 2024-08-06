require "test_helper"

class CommentTest < ActionDispatch::IntegrationTest
  test "can create a comment" do
    sign_in (User.first)
    post "/comments", params: { comment: { post_id: Post.first.id, body: "This is my new comment." }  }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Comment added successfully."
    assert_select "p", "This is my new comment."
  end

end

