require 'test_helper'

class Api::V1::AppointmentPrivateSerializerTest < ActiveSupport::TestCase
  def test_fields
    serializer = Api::V1::AppointmentPrivateSerializer.new(appointments(:one))

    fields = [:id, :user_id, :bookie_id, :time, :occurred, :user_note, :bookie_note, :created_at]
    assert_equal serializer.attributes.keys, fields
  end
end
