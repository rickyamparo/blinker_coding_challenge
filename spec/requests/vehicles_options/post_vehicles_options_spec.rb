require 'rails_helper'

RSpec.describe 'Vehicles Options POST API', type: :request do
  let!(:vehicle) {create(:vehicle)}
  let!(:option) {create(:option)}

  let(:vehicle_id) {vehicle.id}
  let(:option_id) {option.id}

  describe "POST /api/v1/vehicles_options" do
    let(:valid_vehicle_option_attributes) { {
      vehicle_id: vehicle_id,
      option_id: option_id
    } }

    context 'when the record is valid' do
      before { post '/api/v1/vehicles_options', params: valid_vehicle_option_attributes}

      it "creates an option for a vehicle" do
        expect(json['vehicle_id']).to eq(vehicle_id)
        expect(json['option_id']).to eq(option_id)
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the record is invalid' do
      before { post '/api/v1/vehicles_options', params: { vehicle_id: 0, option_id: 0} }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns an invalid record message" do
        expect(response.body).to match(/Validation failed:/)
      end
    end
  end
end
