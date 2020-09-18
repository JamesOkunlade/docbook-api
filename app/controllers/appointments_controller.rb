class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :update, :destroy]

    # GET /appointments
    def index
        # @appointments = Appointment.all
        @appointments = current_user.appointments.all
        json_response(@appointments)
    end

    # POST /appointments
    def create
        @appointment = current_user.appointments.create!(appointment_params)
        json_response(@appointment, :created)
    end

    # PUT /appointments/:id
    def update
        @appointment.update(appointment_params)
        head :no_content
    end

    # DELETE /appointments/:id
    def destroy
        @appointment.destroy
        head :no_content
    end


    private

    def appointment_params
        # Whitelist
        params.permit(:label, :date, :doctor_id, :user_id)
    end

    def set_appointment
        @appointment = Appointment.find(params[:id])
    end
end
