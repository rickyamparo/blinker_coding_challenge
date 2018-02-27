require 'rails_helper'

RSpec.describe "Vehicles API", type: :request do
  let!(:vehicles) {create_list(:vehicle, 10)}

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
end
