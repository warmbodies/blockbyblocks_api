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
      post :create, { user: { email: 'some@email.com', password: 'asdfasdf', first_name: 'John', last_name: 'Smith' } }
    end

    assert_success
    assert_json

    user = assigns(:user)
    assert_equal 'some@email.com', user.email
    assert_equal 'asdfasdf', user.password
    assert_equal 'John', user.first_name
    assert_equal 'Smith', user.last_name
  end
end
