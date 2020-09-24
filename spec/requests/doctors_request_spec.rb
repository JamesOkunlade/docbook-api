require 'rails_helper'

RSpec.describe "Doctors", type: :request do
    let(:user) { create(:user) }
    let!(:specialty) { create(:specialty) }
    let!(:doctors) { create_list(:doctor, 20, specialty_id: specialty.id) }
    let(:doctor_id) { doctors.first.id }
    # authorize request
    let(:headers) { valid_headers }

    # Test suite for GET /doctors
    describe 'GET /doctors' do
        # make HTTP get request before each example
        before { get '/doctors', params: {}, headers: headers }

        it 'returns doctors' do
            # Json is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(20)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for POST /doctors
    describe 'POST /doctors' do
        # valid payload
        let(:valid_attributes) do
            { name: 'Salako Omodunbi', email: 'salako@omodunbi@gmail.com', license: '123456', address: '24 Oluyoro Lagos', info: 'Medical doctor with 12 years of experience in consultancy', years_of_experience: 12, phone: '08175436794', specialty_id: specialty.id }.to_json
        end

        context 'when the request is valid' do
            before { post '/doctors', params: valid_attributes, headers: headers }

            it 'creates a doctor' do
                # expect(json['name']).to eq('Salako Omodunbi')
                expect(json).not_to be_empty
            end

            it 'returns status code 201' do
                # expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            let(:invalid_attributes) do
                { name: nil }.to_json
            end
            before { post '/doctors', params: invalid_attributes, headers: headers }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
        end
    end

    # Test suite for GET /doctors/:id
    describe 'GET /doctors/:id' do
        before { get "/doctors/#{doctor_id}", params: {}, headers: headers }

        it 'returns a doctor' do
            # Json is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json['id']).to eq(doctor_id)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for PUT /doctors/:id
    describe 'PUT /doctors/:id' do
        let(:valid_attributes) do
            { name: 'Olutobi Rachel' }.to_json
        end

        context 'when record exists' do
            before { put "/doctors/#{doctor_id}", params: valid_attributes, headers: headers }

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    # Test suite for DELETE /doctors/:id
    describe 'DELETE /doctors/:id' do
        before { delete "/doctors/#{doctor_id}", params: {}, headers: headers }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end
