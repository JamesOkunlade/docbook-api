class SpecialtiesController < ApplicationController
    before_action :set_specialty, only: [:update, :destroy]

    # GET /specialties
    def index
        @specialties = Specialty.all
        json_response(@specialties)
    end

    # POST /specialties
    def create
        @specialty = Specialty.create!(specialty_params)
        json_response(@specialty, :created)
    end

    # PUT /specialties/:id
    def update
        @specialty.update(specialty_params)
        head :no_content
    end

    # DELETE /specialties/:id
    def destroy
        @specialty.destroy
        head :no_content
    end

    private

    def specialty_params
        # whitelist
        params.permit(:area_of_specialization)
    end

    def set_specialty
        @specialty = Specialty.find(params[:id])
    end
end
