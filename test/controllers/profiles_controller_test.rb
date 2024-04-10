require "test_helper"

describe ProfilesController do
  it "gets new" do
    get profiles_new_url
    must_respond_with :success
  end

  it "gets create" do
    get profiles_create_url
    must_respond_with :success
  end

  it "gets update" do
    get profiles_update_url
    must_respond_with :success
  end

  it "gets edit" do
    get profiles_edit_url
    must_respond_with :success
  end

  it "gets destroy" do
    get profiles_destroy_url
    must_respond_with :success
  end
end
