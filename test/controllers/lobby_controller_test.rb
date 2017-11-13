require 'test_helper'

class LobbyControllerTest < ActionDispatch::IntegrationTest
  test "should get lobby" do
    get lobby_lobby_url
    assert_response :success
  end

end
