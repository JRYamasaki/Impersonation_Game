require 'test_helper'

class AccessControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get access_login_url
    assert_response :success
  end

  test "should display error message" do
  	post access_attempt_login_url, params:{:username => "notAUser", :password => "notAUser"}
  	assert_equal "Incorrect username/password", flash[:notice]
  end

  test "should correctly login user" do
  	post access_attempt_login_url, params:{"username" => "MyString", "password" => "MyString"}
  	assert_equal "Logged in succesfully", flash[:notice]
  end
end
