# frozen_string_literal: true

require 'test_helper'

module Shops
  class CustomersControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get shops_customers_index_url
      assert_response :success
    end

    test 'should get show' do
      get shops_customers_show_url
      assert_response :success
    end
  end
end
