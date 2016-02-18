require 'test_helper'

class Api::V1::CurrentUserSerializerTest < ActiveSupport::TestCase
  def test_fields
    serializer = Api::V1::CurrentUserSerializer.new(users(:one))

    fields = [:id, :email, :first_name, :last_name, :phone, :username, :remind_via_email, :remind_via_phone, :gravatar_url]
    assert_equal serializer.attributes.keys, fields
  end
end
