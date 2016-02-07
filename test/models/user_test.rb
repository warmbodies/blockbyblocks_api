require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_sets_access_token
    user = User.create!(email: 'something@something.com', password: 'asdfasdf', username: 'something')

    assert user.access_token
    assert user.gravatar_url
  end
end
