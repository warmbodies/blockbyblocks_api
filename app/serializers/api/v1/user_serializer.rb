class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :username, :gravatar_url
end
