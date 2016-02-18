require 'test_helper'

class UserPolicyTest < ActiveSupport::TestCase

  def test_scope
  end

  def test_show
  end

  def test_create
  end

  def test_update
    assert UserPolicy.new(users(:one), users(:one)).update?
    assert_equal false, UserPolicy.new(users(:one), users(:reset_password)).update?
  end

  def test_destroy
  end
end
