require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_sets_access_token
    assert User.create!(email: 'something@something.com', password: 'asdfasdf', username: 'something', first_name: 'first', last_name: 'last').access_token
  end
end
