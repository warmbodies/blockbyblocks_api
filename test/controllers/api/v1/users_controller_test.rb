require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def test_create_with_invalid_credentials
    assert_no_difference "User.count" do
      post :create, { user: { email: nil, password: nil } }
    end

    assert_unprocessable_entity
    assert_json
  end

  def test_create
    assert_difference "User.count" do
      post :create, { user: { email: 'some@email.com', password: 'asdfasdf', first_name: 'John', last_name: 'Smith', username: 'some_username' } }
    end

    assert_success
    assert_json

    user = assigns(:user)
    assert_equal 'some@email.com', user.email
    assert_equal 'asdfasdf', user.password
    assert_equal 'John', user.first_name
    assert_equal 'Smith', user.last_name
    assert_equal 'some_username', user.username
  end

  def test_forgot_password_with_invalid_credentials
    post :forgot_password, { user: { email: nil } }

    assert_unprocessable_entity
    assert_json
  end

  def test_forgot_password
    user = users(:one)

    refute user.reset_password_token
    refute user.reset_password_sent_at

    post :forgot_password, { user: { email: user.email } }

    assert_success
    assert_json

    user.reload
    assert user.reset_password_token
    assert user.reset_password_sent_at
  end

  def test_reset_password_with_invalid_credentials
    post :reset_password, { user: { reset_password_token: nil } }

    assert_unprocessable_entity
    assert_json
  end

  def test_reset_password_with_invalid_confirmation
    user = users(:reset_password)

    post :reset_password, { user: { reset_password_token: user.reset_password_token, password: 'new_pass', password_confirmation: 'wrong' } }

    assert_unprocessable_entity
    assert_json
  end

  def test_reset_password
    user = users(:reset_password)

    post :reset_password, { user: { reset_password_token: user.reset_password_token, password: 'new_pass', password_confirmation: 'new_pass' } }

    assert_success
    assert_json

    user.reload
    refute user.reset_password_token
  end
end
