ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def assert_success
    assert_response :success
  end

  def assert_unprocessable_entity
    assert_response :unprocessable_entity
  end

  def assert_json
    assert_equal Mime::JSON, response.content_type
  end
end

class ActionController::TestCase
  include Devise::TestHelpers

  def set_headers(user)
    token = "Token token=\"#{user.access_token}\", email=\"#{user.email}\""
    @request.env['HTTP_AUTHORIZATION'] = token
  end
end
