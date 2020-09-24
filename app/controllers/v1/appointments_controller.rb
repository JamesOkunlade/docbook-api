# app/controllers/v1/appointments_controller.rb

module V1
    class AppointmentsController < ApplicationController
        before_action :set_appointment, only: [:show, :update, :destroy]

        # GET /appointments
        def index
            @appointments = Appointment.all
            json_response(@appointments)
        end

        # GET /users/:id/appointments
        def user_appointments
            @appointments = Appointment.all.where('user_id = ?', current_user.id)
            json_response(@appointments)
        end
        
        # GET /doctors/:id/appointments
        def doctor_appointments
            @appointments = Appointment.all.where('doctor_id = ?', current_user.id)
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
end
