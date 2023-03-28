require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)

    # for testing nil and empty 
    @user_empty = users(:three)
    @user_nil = users(:four)
  end 

  test "email can't be blank" do
    user  = @user
    assert_not_empty(user.email)
  end

  test "email can't be nil" do
    user  = @user
    assert_not_nil(user.email)
  end

  test "email should be unique" do
    @another_user = User.new(email: @user.email, password_digest: @user.password_digest, token: @user.token)
    assert_not @another_user.save 
  end
 
  test "password can't be blank" do
    user  = @user
    assert_not_empty(user.password_digest)
  end

  test "password can't be nil" do
    user  = @user
    assert_not_nil(user.password_digest)
  end
end
