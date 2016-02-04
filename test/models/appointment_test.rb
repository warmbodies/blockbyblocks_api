require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  def test_valid
    assert appointments(:one).valid?
    refute Appointment.new.valid?
  end
end
