class Api::V1::AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :bookie_id, :occurred
end
