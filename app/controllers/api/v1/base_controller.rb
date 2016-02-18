class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user_from_token!

  private
    def authenticate_user_from_token!
      try_authenticate_user_from_token

      render json: { error: 'Token authentication failed.'}, status: 401 unless current_user.present?
    end

    def try_authenticate_user_from_token
      authenticate_with_http_token do |token, options|
        user_email = options[:email].presence
        user = user_email && User.find_by_email(user_email)

        if user && Devise.secure_compare(user.access_token, token)
          sign_in user, store: false
        end
      end
    end
end

