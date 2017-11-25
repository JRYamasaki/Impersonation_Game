require 'test_helper'

class LobbyControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login" do
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

  test "create lobby" do
    user = User.new(:username => "t", :password => "t", :email => "t", adminbit: false)
    post lobby_new_url, params:{:title => "testLobby", :spotsLeft => 0, :user => user}
    lobby = Lobby.new(:title => "testLobby", :spotsLeft => 0, :user => user)
    lobby.save
    lobby = Lobby.pluck(:title)
    assert_not_nil lobby
    assert_equal "testLobby", lobby[2]
  end  


end
