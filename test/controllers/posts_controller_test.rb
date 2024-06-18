require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers
  
  test "should not get index if not signed in" do
    get posts_url 
    assert_response :redirect, "found posts url despite not signed in"
  end

  test "signed in user should get index page" do
    sign_in User.first
    get :index
    assert_response :success
  end
end
