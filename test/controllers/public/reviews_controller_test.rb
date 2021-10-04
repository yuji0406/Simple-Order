# frozen_string_literal: true

require 'test_helper'

module Public
  class ReviewsControllerTest < ActionDispatch::IntegrationTest
    test 'should get create' do
      get public_reviews_create_url
      assert_response :success
    end

    test 'should get destroy' do
      get public_reviews_destroy_url
      assert_response :success
    end
  end
end
