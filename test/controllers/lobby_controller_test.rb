require 'test_helper'

class LobbyControllerTest < ActionDispatch::IntegrationTest
  test "should get lobby" do
    get lobby_lobby_url
    assert_response :redirect
  end

  test "should allow user to create lobby" do
  	post access_attempt_login_url, params:{"username" => "MyString", "password" => "MyString"}
  	get lobby_new_url
    assert_response :success
  end

  test "should allow user to view all lobby" do
  	post access_attempt_login_url, params:{"username" => "MyString", "password" => "MyString"}
  	get lobby_index_url
    assert_response :success
  end

end
