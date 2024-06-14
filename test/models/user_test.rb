require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "should not save user without email" do
    user = User.new(name: 'Bob', password: 'somepassword')
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without name" do
    user = User.new(email: 'bob@gmail.com', password: 'somepassword')
    assert_not user.save, "Saved the user without a name"
  end

  test "should not save user without password" do
    user = User.new(email: 'bob@gmail.com', name: 'Bob')
    assert_not user.save, "Saved the user without a password"
  end

  test "should save user with name, email and password" do
    user = User.new(name: 'PeterHawes', email: 'peter.hawes@gmail.com', password: 'somepassword')
    # this test avoids email value used in users.yml fixtures file, due to uniqueness of emails
    assert user.save, "Failed to save a user with name, email and password."
  end

  test "should not save user with duplicated email address" do
    user = User.new(name: 'PeterHawes', email: User.first.email, password: 'somepassword')
    assert_not user.save, "Saved a user with a duplicated email address"
  end
end
