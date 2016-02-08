class Api::V1::AppointmentPublicSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :time, :created_at
end
