class Api::V1::CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :phone, :username, :remind_via_email, :remind_via_phone, :gravatar_url
end
