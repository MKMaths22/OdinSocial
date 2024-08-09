require "test_helper"

class CommentTest < ActionDispatch::IntegrationTest
  test "can create a comment" do
    sign_in (Post.first.author)
    # this is relevant because of the way the comments controller redirects you after adding a comment. If another user added a comment to a post not authored by them or someone they followed, their comment would not show after the redirect.
    post "/comments", params: { comment: { post_id: Post.first.id, body: "This is my new comment." }  }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p.notice", "Comment added successfully."
    assert_select "p.commentbody", "This is my new comment."
  end

  test "can edit a comment" do
    sign_in users(:peter)
    comment_id = Comment.find_by(author: users(:peter)).id
    patch "/comments/#{comment_id}", params: { comment: { body: "The edited comment." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p.notice", "Comment updated successfully."
    assert_select "p.commentbody", "The edited comment."
  end

end

