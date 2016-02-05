class Api::V1::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(user_id: params[:user_id])
    render json: @appointments, status: :ok, each_serializer: Api::V1::AppointmentSerializer
  end
end
