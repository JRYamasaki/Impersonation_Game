require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login" do
    get user_users_url
    assert_response :redirect
  end

  test "allow admin to view all users" do
  	post access_attempt_login_url, params:{"username" => "admin", "password" => "admin"}
  	get user_users_url
    assert_response :redirect
  end

  test "create valid user" do
  	user = User.new(username: 'test', password: 'test', email: 'test', adminbit: 'test');
  	assert user.valid?
  end
end
