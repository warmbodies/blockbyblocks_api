class Api::V1::AppointmentPrivateSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :bookie_id, :time, :occurred, :user_note, :bookie_note, :created_at
end
