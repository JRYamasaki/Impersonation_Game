require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:validUser)
  	@missingUsername = users(:missingUsername)
  	@missingPassword = users(:missingPassword)
  	@missingEmail = users(:missingEmail)
  end

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
  	assert @user.valid?
  end

  test "create invalid user with no username" do
  	assert_not @missingUsername.valid?
  end

  test "create invalid user with no password" do
  	assert_not @missingPassword.valid?
  end

  test "create invalid user with no email" do
  	assert_not @missingEmail.valid?
  end
end
