require 'rails_helper'

RSpec.describe "Specialties", type: :request do
    let!(:specialties) { create_list(:specialty, 10) }
    let(:specialty_id) { specialties.first.id }
    
    # authorize request
    let(:headers) { valid_headers }

    # Test suite for GET specialties
    describe 'GET /specialties' do
        before { get '/specialties', params: {}, headers: headers }

        it 'returns specialties' do
            # Json is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for POST specialties
    describe 'POST /specialties' do
        let(:valid_attributes) {{ area_of_specialization: 'Dermatology' }}

        context 'when the request is valid' do
            before { post '/specialties', params: valid_attributes, headers: headers }

            it 'creates a doctor' do
                expect(json['area_of_specialization']).to eq('Dermatology')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/specialties', params: { area_of_specialization: nil} }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
        end
    end

    # Test suite for PUT specialty
    describe 'PUT /specialties/:id' do
        let(:valid_attributes) {{ area_of_specialization: 'Oncology' }}

        context 'when record exists' do
            before { put "/specialties/#{specialty_id}", params: valid_attributes, headers: headers }

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    # Test suite for DELETE specialy 
    describe 'DELETE /specialties/:id' do
        before { delete "/specialties/#{specialty_id}", params: {}, headers: headers }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end


end
