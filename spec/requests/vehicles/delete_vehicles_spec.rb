require 'rails_helper'

RSpec.describe 'Vehicles DELETE API', type: :request do
  let!(:vehicles) {create_list(:vehicle, 10)}
  let(:vehicle_id) { vehicles.first.id }
  
  describe 'Delete /api/v1/vehicles/#{vehicle_id}' do
    before { delete "/api/v1/vehicles/#{vehicle_id}"}

    it "returns a 204 status code" do
      expect(response).to have_http_status(204)
    end
  end
end
