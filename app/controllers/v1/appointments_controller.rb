# app/controllers/v1/appointments_controller.rb

module V1
    class AppointmentsController < ApplicationController
        before_action :set_appointment, only: [:show, :update, :destroy]
        before_action :set_user, only: [:user_appointments]
        before_action :set_doctor, only: [:doctor_appointments]

        # GET /appointments
        def index
            @appointments = Appointment.all
            json_response(@appointments)
        end

        # GET /users/:id/appointments
        def user_appointments
            # @appointments = Appointment.all.where('user_id = ?', current_user.id)
            @appointments = Appointment.all.where('user_id = ?', @user.id)
            json_response(@appointments)
        end
        
        # GET /doctors/:id/appointments
        def doctor_appointments
            # @appointments = Appointment.all.where('doctor_id = ?', current_user.id)
            @appointments = Appointment.all.where('doctor_id = ?', @doctor.id)
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

        def set_user
            @user = User.find(params[:id])
        end
        
        def set_doctor
            @doctor = Doctor.find(params[:id])
        end
    end
end
