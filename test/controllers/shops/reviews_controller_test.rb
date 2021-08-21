require 'test_helper'

class Shops::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shops_reviews_show_url
    assert_response :success
  end

end
