require 'test_helper'

class MainpageControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login" do
    get mainpage_mainpage_url
    assert_response :redirect
  end

  test "should put user on mainpage" do
  	post access_attempt_login_url, params:{"username" => "MyString", "password" => "MyString"}
  	get mainpage_mainpage_url
    assert_response :success
  end
end
