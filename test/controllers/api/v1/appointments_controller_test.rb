require 'test_helper'

class Api::V1::AppointmentsControllerTest < ActionController::TestCase
  def test_index_unauthenticated
    user = users(:one)

    get :index, { user_id: user.id }

    assert_success
    assert_json

    appointments = JSON.parse(@response.body)["appointments"]

    assert_equal user.appointments.count, appointments.count

    appointment = appointments.first

    assert appointment["user_id"]
    assert appointment["time"]
    assert appointment["created_at"]

    refute appointment["bookie_id"]
    refute appointment["occurred"]
    refute appointment["user_note"]
    refute appointment["bookie_note"]
  end

  def test_index_authenticated
    user = users(:one)

    set_headers(user)

    get :index, { user_id: user.id }

    assert_success
    assert_json

    appointments = JSON.parse(@response.body)["appointments"]

    assert_equal user.appointments.count, appointments.count

    appointment = appointments.first

    assert appointment["user_id"]
    assert appointment["bookie_id"]
    assert appointment["time"]
    assert [true, false].include?(appointment["occurred"])
    assert appointment["user_note"]
    assert appointment["bookie_note"]
    assert appointment["created_at"]
  end
end
