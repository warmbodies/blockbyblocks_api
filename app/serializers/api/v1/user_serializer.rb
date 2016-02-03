class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :access_token, :first_name, :last_name
end
