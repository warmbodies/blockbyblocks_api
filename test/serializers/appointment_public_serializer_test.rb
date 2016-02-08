require 'test_helper'

class Api::V1::AppointmentPublicSerializerTest < ActiveSupport::TestCase
  def test_fields
    serializer = Api::V1::AppointmentPublicSerializer.new(appointments(:one))

    fields = [:id, :user_id, :time, :created_at]
    assert_equal serializer.attributes.keys, fields
  end
end
