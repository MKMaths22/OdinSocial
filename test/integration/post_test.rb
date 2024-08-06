require "test_helper"

class PostTest < ActionDispatch::IntegrationTest
  test "can see the index page" do
    sign_in (User.first)
    get "/"
    assert_select "h1", "My Recent Authored Posts"
    assert_select "h1", "Recent Posts Authored by Those I Follow"
  end

  test "can create a post" do
    sign_in(User.first)
    get "/posts/new"
    assert_response :success
    post "/posts", params: { post: { title: "Brand new post", body: "Post body" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Brand new post"
    assert_select "div", "Post body"
  end

  test "can edit a post" do
    sign_in(User.first)
    post_id = Post.find_by(author: User.first).id
    patch "/posts/#{post_id}", params: { post: { title: "Edited Title", body: "Edited body" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Edited Title"
    assert_select "div", "Edited body"
  end
end
