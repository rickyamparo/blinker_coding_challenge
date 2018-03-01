require 'rails_helper'

RSpec.describe 'Vehicles Options DELETE API', type: :request do
  let!(:vehicle) {create(:vehicle)}
  let!(:option) {create(:option)}

  let(:vehicle_id) {vehicle.id}
  let(:option_id) {option.id}

  let(:vehicle_option) {create(:vehicles_option,
                                  vehicle_id: vehicle_id,
                                  option_id: option_id)}
  let(:vehicle_option_id) {vehicle_option.id}

  describe 'Delete /api/v1/vehicles_options/#{vehicle_option_id}' do
    before { delete "/api/v1/vehicles_options/#{vehicle_option_id}" }

    it 'returns a 204 status code' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'Delete /api/v1/vehicles_options/#{vehicle_option_id}' do
    before { delete "/api/v1/vehicles_options/0" }

    it 'returns a 204 status code' do
      expect(response).to have_http_status(404)
    end
  end
end
