# frozen_string_literal: true

require 'test_helper'

module Public
  class ShopsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get public_shops_index_url
      assert_response :success
    end

    test 'should get show' do
      get public_shops_show_url
      assert_response :success
    end
  end
end
