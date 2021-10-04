# frozen_string_literal: true

require 'test_helper'

module Shops
  class ReviewsControllerTest < ActionDispatch::IntegrationTest
    test 'should get show' do
      get shops_reviews_show_url
      assert_response :success
    end
  end
end
