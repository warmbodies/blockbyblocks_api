class Api::V1::SessionsController < Api::V1::BaseController
  def create

  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
