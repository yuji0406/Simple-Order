require 'test_helper'

class Shops::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get shops_homes_top_url
    assert_response :success
  end

end
