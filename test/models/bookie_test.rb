require 'test_helper'

class BookieTest < ActiveSupport::TestCase
  def test_valid
    assert bookies(:one).valid?
    refute Bookie.new.valid?
  end
end
