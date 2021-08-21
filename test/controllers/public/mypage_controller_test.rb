require 'test_helper'

class Public::MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_mypage_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_mypage_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_mypage_update_url
    assert_response :success
  end

end
