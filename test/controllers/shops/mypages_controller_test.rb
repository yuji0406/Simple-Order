require 'test_helper'

class Shops::MypagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shops_mypages_show_url
    assert_response :success
  end

  test "should get edit" do
    get shops_mypages_edit_url
    assert_response :success
  end

  test "should get update" do
    get shops_mypages_update_url
    assert_response :success
  end

end
