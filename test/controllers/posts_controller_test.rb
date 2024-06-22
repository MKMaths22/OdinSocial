require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  test "should not get index if not signed in" do
    get posts_url 
    assert_response :redirect, "found posts url despite not signed in"
  end

  test "signed in user should get index page" do
    sign_in users(:peter)
    get posts_url
    assert_response :success, "signed in user did not reach posts#index view"
  end

  test "signed in user should not be able to update post they did not author" do
    sign_in users(:peter)
    @post = Post.find_by(author: users(:chris))
    post_params = { post: {title: 'NewTitle'} }
    patch post_url(@post), params: post_params
    @post.reload
    assert_not_equal('NewTitle', @post.title)
  end

  test "signed in user should be able to update post they authored" do
    sign_in users(:peter)
    @post = Post.find_by(author: users(:peter))
    post_params = { post: {title: 'NewTitle'} }
    patch post_url(@post), params: post_params
    @post.reload
    assert_equal('NewTitle', @post.title)
  end

  test "signed in user should not be able to delete post they did not author" do
    sign_in users(:peter)
    @post = Post.find_by(author: users(:chris))
    post_id = @post.id
    delete post_url(@post)
    assert_not_nil(Post.find_by(id: post_id))
  end

  test "signed in user should be able to delete post they authored" do
    sign_in users(:peter)
    @post = Post.find_by(author: users(:peter))
    post_id = @post.id
    delete post_url(@post)
    assert_nil(Post.find_by(id: post_id))
  end
end
