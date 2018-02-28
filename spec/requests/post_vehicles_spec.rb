require 'rails_helper'

RSpec.describe 'Vehicles post API', type: :request do
  let!(:vehicles) {create_list(:vehicle, 10)}
  let(:vehicle_id) { vehicles.first.id }

  describe "POST /api/v1/vehicles" do
    let(:valid_vehicle_attributes) { { make: 'subaru',
                                       model: '4-door',
                                       options: 'cup holders,air conditioning'
                                   } }
    context 'when the record is valid' do
      before { post '/api/v1/vehicles', params: valid_vehicle_attributes}

      it "creates a vehicle" do
        expect(json['make']).to eq('subaru')
        expect(json['model']).to eq('4-door')
        expect(json['options']).to eq(['cup holders', 'air conditioning'])
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
