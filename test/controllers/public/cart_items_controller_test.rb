# frozen_string_literal: true

require 'test_helper'

module Public
  class CartItemsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get public_cart_items_index_url
      assert_response :success
    end

    test 'should get update' do
      get public_cart_items_update_url
      assert_response :success
    end

    test 'should get destroy' do
      get public_cart_items_destroy_url
      assert_response :success
    end

    test 'should get empty' do
      get public_cart_items_empty_url
      assert_response :success
    end

    test 'should get create' do
      get public_cart_items_create_url
      assert_response :success
    end
  end
end
