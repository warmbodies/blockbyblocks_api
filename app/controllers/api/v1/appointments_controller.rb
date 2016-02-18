class Api::V1::AppointmentsController < Api::V1::BaseController
  skip_before_filter :authenticate_user_from_token!
  before_filter :try_authenticate_user_from_token

  def index
    @appointments = Appointment.where(user_id: params[:user_id])

    serializer = current_user.present? ? Api::V1::AppointmentPrivateSerializer : Api::V1::AppointmentPublicSerializer
    render json: @appointments, status: :ok, each_serializer: serializer
  end
end
