class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, serializer: Api::V1::UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def forgot_password
    if params[:user].try(:[], :email).present?
      @user = User.find_by_email(params[:user][:email])

      if @user.present?
        @user.send_reset_password_instructions
        render json: { success: true }, status: :ok
      else
        render json: { error: 'No user found' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'No email passed' }, status: :unprocessable_entity
    end
  end

  def reset_password
    if params[:user].nil? || params[:user][:reset_password_token].nil? || params[:user][:password].nil? || params[:user][:password_confirmation].nil?
      render json: { error: 'Invalid parameters' }, status: :unprocessable_entity and return
    end

    @user = User.where(reset_password_token: params[:user][:reset_password_token]).first

    if @user.present?
      if @user.reset_password(params[:user][:password], params[:user][:password_confirmation])
        render json: { success: true }, status: :ok
      else
        render json: { error: 'Invalid password or password confirmation' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Invalid password reset token' }, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(User::PARAMS)
    end
end
