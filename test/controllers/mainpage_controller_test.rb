require 'test_helper'

class MainpageControllerTest < ActionDispatch::IntegrationTest
  test "should get mainpage" do
    get mainpage_mainpage_url
    assert_response :success
  end

end
