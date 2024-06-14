require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "should not save user without email" do
    user = User.new(name: 'Peter', password: 'somepassword')
    assert_not user.save
  end

  test "should not save user without name" do
    user = User.new(email: 'peter@gmail.com', password: 'somepassword')
    assert_not user.save
  end

  test "should not save user without password" do
    user = User.new(email: 'peter@gmail.com', name: 'Peter')
    assert_not user.save
  end

  test "should save user with name, email and password" do
    user = User.new(name: 'Somename', email: 'somename@gmail.com', password: 'somepassword')
    assert user.save
  end
end
