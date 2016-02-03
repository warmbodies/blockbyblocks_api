require 'test_helper'

class Api::V1::SessionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def test_create_with_missing_credentials
    post :create

    assert_unprocessable_entity
    assert_json
  end

  def test_create_with_invalid_credentials
    post :create, { user: { email: 'wrong', password: 'wrong' } }

    assert_unprocessable_entity
    assert_json
  end

  def test_create
    post :create, { user: { email: 'test@test.com', password: 'password' } }

    assert_success
    assert_json
  end
end
