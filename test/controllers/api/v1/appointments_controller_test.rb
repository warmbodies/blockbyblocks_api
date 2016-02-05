require 'test_helper'

class Api::V1::AppointmentsControllerTest < ActionController::TestCase
  def test_index_unauthenticated
    user = users(:one)

    get :index, { user_id: user.id }

    assert_success
    assert_json

    assert_equal user.appointments.count, assigns(:appointments).count
  end

  def test_index_authenticated
    skip("todo")
    user = users(:one)

    get :index, { user_id: user.id }

    assert_success
    assert_json

    appointments = assigns(:appointments)
    assert_equal user.appointments.count, appointments.count
  end
end
