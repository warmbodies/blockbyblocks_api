class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_filter :authenticate_user_from_token!, only: [:create]

  def create
    if params[:user].present? && params[:user][:email].present? && params[:user][:password].present?
      @user = User.find_by_email(params[:user][:email])

      if @user.present? && @user.valid_password?(params[:user][:password])
        sign_in(@user)
        render json: { token: @user.access_token, email: @user.email }, status: :created
      else
        render json: { error: 'Invalid login credentials' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Missing session credentials' }, status: :unprocessable_entity
    end
  end

  def current_users
    render json: current_user, status: :ok, serializer: Api::V1::CurrentUserSerializer
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
