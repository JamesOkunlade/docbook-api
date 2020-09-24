require 'rails_helper'

RSpec.describe "Appointments", type: :request do
    # Initialize test data
    let!(:user) { create(:user) }
    let!(:doctor) { create(:doctor) }
    let!(:appointments) { create_list(:appointment, 3, doctor_id: doctor.id, user_id: user.id) }
    let(:appointment_id) { appointments.first.id }
    let(:user_id) { user.id }
    let(:doctor_id) { doctor.id }

    # authorize request
    let(:headers) { valid_headers }

    # Test suite for GET /users/:id/appointments
    describe 'GET /users/:id/appointments' do
        # make HTTP get request before each example
        before { get "/users/#{user_id}/appointments", params: {}, headers: headers }

        it 'returns appointments' do
            # Json is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(3)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for GET /doctors/:id/appointments
    describe 'GET /doctors/:id/appointments' do
        # make HTTP get request before each example
        before { get "/doctors/#{doctor_id}/appointments", params: {}, headers: headers }

        it 'returns appointments' do
            # Json is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(3)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for POST /appointments
    describe 'POST /appointments' do
        # valid payload
        let(:valid_attributes) do
            { label: 'Meeting my demartologist', date: 'October 21, 2018 20:47', doctor_id: doctor.id, user_id: user.id }.to_json
        end
         
        context 'when the request is valid' do
            before { post '/appointments', params: valid_attributes, headers: headers }

            it 'creates an appointment' do
                expect(json['label']).to eq('Meeting my demartologist')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            let(:invalid_attributes) do
                { label: nil }.to_json
            end
            before { post '/appointments', params: invalid_attributes, headers: headers }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
        end
    end

    # Test suite for PUT /appointments/:id
    describe 'PUT /appointments/:id' do
        let(:valid_attributes) do
            { label: 'Meeting my optamologist' }.to_json
        end

        context 'when record exists' do
            before { put "/appointments/#{appointment_id}", params: valid_attributes, headers: headers }

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    # Test suite for DELETE /appointments/:id
    describe 'DELETE /appointments/:id' do
        before { delete "/appointments/#{appointment_id}", params: {}, headers: headers }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end


end
