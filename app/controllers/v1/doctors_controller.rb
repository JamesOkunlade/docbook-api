# app/controllers/v1/doctors_controller.rb

module V1
    class DoctorsController < ApplicationController
        before_action :set_doctor, only: [:show, :update, :destroy]

        # GET /doctors
        def index
            @doctors = Doctor.all.paginate(page: params[:page], per_page: 10)
            json_response(@doctors)
        end

        # POST /doctors
        def create
            @doctor = Doctor.create!(doctor_params)
            json_response(@doctor, :created)
        end

        # GET /doctors/:id
        def show
            json_response(@doctor)
        end

        # PUT /doctors/:id
        def update
            @doctor.update(doctor_params)
            head :no_content
        end

        # DELETE /doctors/:id
        def destroy
            @doctor.destroy
            head :no_content
        end

        private

        def doctor_params
            # whitelist
            params.permit(:name, :email, :license, :address, :info, :years_of_experience, :phone, :specialty_id)
        end

        def set_doctor
            @doctor = Doctor.find(params[:id])
        end

    end
end
