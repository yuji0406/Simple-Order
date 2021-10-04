# frozen_string_literal: true

require 'test_helper'

module Public
  class OrdersControllerTest < ActionDispatch::IntegrationTest
    test 'should get new' do
      get public_orders_new_url
      assert_response :success
    end

    test 'should get complete' do
      get public_orders_complete_url
      assert_response :success
    end

    test 'should get create' do
      get public_orders_create_url
      assert_response :success
    end

    test 'should get index' do
      get public_orders_index_url
      assert_response :success
    end

    test 'should get show' do
      get public_orders_show_url
      assert_response :success
    end
  end
end
