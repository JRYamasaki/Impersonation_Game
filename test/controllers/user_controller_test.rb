require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login" do
    get user_users_url
    assert_response :redirect
  end

end
