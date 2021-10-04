# frozen_string_literal: true

require 'test_helper'

module Public
  class MessagesControllerTest < ActionDispatch::IntegrationTest
    test 'should get create' do
      get public_messages_create_url
      assert_response :success
    end
  end
end
