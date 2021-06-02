module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :authorize_user
      before_action :set_appointment, only: %i[show update destroy]

      def index
        @appointments = @current_user.appointments
        render json: @appointments, include: %i[item], status: 200
      end

      def show
        render json: @appointment, status: 200
      end

      def create
        @appointment = @current_user.appointments.create(date: a_params[:date],
                                                         item_id: a_params[:item_id], branch: a_params[:branch])

        if @appointment.valid?
          render json: @appointment, status: 201
        else
          render json: { error: 'Appointment could not be created!' }, status: 404
        end
      end

      def update
        if @appointment.update(date: a_params[:date], item_id: a_params[:item_id],
                               branch: a_params[:branch])
          render json: @appointment, status: 200
        else
          render json: { error: 'Could not update appointment!' }, status: 422
        end
      end

      def destroy
        @appointment.destroy
        render json: { message: 'Successfully deleted appointment!', deleted_appointment: @appointment }, status: 200
      end

      private

      def a_params
        params.require(:appointment).permit(:date, :item_id, :branch)
      end

      def set_appointment
        @appointment = @current_user.appointments.find(params[:id])
      end
    end
  end
end
