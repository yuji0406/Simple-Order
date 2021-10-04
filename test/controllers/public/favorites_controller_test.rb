# frozen_string_literal: true

require 'test_helper'

module Public
  class FavoritesControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get public_favorites_index_url
      assert_response :success
    end

    test 'should get create' do
      get public_favorites_create_url
      assert_response :success
    end

    test 'should get destroy' do
      get public_favorites_destroy_url
      assert_response :success
    end
  end
end
