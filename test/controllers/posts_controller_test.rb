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
end
