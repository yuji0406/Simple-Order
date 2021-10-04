# frozen_string_literal: true

require 'test_helper'

module Shops
  class HomesControllerTest < ActionDispatch::IntegrationTest
    test 'should get top' do
      get shops_homes_top_url
      assert_response :success
    end
  end
end
