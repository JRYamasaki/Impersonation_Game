require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get user_login_url
    assert_response :success
  end

  test "should get registration" do
    get user_registration_url
    assert_response :success
  end

  test "should get users" do
    get user_users_url
    assert_response :success
  end

end
