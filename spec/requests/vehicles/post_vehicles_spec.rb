require 'rails_helper'

RSpec.describe 'Vehicles POST API', type: :request do

  describe "POST /api/v1/vehicles" do
    let(:valid_vehicle_attributes) { { make: 'subaru',
                                       model: '4-door'
                                   } }
    context 'when the record is valid' do
      before { post '/api/v1/vehicles', params: valid_vehicle_attributes}

      it "creates a vehicle" do
        expect(json['make']).to eq('subaru')
        expect(json['model']).to eq('4-door')
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the record is invalid' do
      before { post '/api/v1/vehicles', params: { identification: "12345" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns an invalid record message' do
        expect(response.body).to match(/Validation failed:/)
      end
    end
  end
end
