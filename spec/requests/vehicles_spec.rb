require 'rails_helper'

RSpec.describe 'Vehicles API', type: :request do
  let!(:vehicles) {create_list(:vehicle, 10)}
  let(:vehicle_id) { vehicles.first.id }

  describe 'GET /api/v1/vehicles' do
    before { get '/api/v1/vehicles' }

    it 'returns list of vehicles' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/vehicles' do
    before { get "/api/v1/vehicles/#{vehicle_id}" }

    context 'when the record exists' do
      it 'returns the vehicle' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(vehicle_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/api/v1/vehicles/0' }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Vehicle/)
      end
    end
  end

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
  end
end
