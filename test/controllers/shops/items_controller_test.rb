# frozen_string_literal: true

require 'test_helper'

module Shops
  class ItemsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get shops_items_index_url
      assert_response :success
    end

    test 'should get new' do
      get shops_items_new_url
      assert_response :success
    end

    test 'should get create' do
      get shops_items_create_url
      assert_response :success
    end

    test 'should get show' do
      get shops_items_show_url
      assert_response :success
    end

    test 'should get edit' do
      get shops_items_edit_url
      assert_response :success
    end

    test 'should get update' do
      get shops_items_update_url
      assert_response :success
    end
  end
end
