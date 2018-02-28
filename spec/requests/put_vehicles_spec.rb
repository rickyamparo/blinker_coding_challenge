require 'rails_helper'

RSpec.describe 'Vehicles PUT API', type: :request do
  let!(:vehicles) {create_list(:vehicle, 10)}
  let(:vehicle_id) { vehicles.first.id }

  describe 'PUT /api/v1/vehicles/#{vehicle_id}' do
    let(:valid_vehicle_attributes) { { make: 'honda',
                                       model: 'sedan',
                                       options: 'nitrous,new car smell'
                                   } }

    context "when the record exists with valid attributes" do
      before { put "/api/v1/vehicles/#{vehicle_id}", params: valid_vehicle_attributes }

      it "updates a vehicle" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end

    context "when the record does not exist" do
      before {put '/api/v1/vehicles/0' }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Vehicle/)
      end
    end

    # context "when the attributes are invalid" do
    #   before  { put "/api/v1/vehicles/#{vehicle_id}", params: {identification: '12345'} }
    #
    #   it 'returns status code 422' do
    #     expect(response).to have_http_status(422)
    #   end
    #
    #   it 'returns an invalid record message' do
    #     expect(response.body).to match(/Validation failed:/)
    #   end
    # end

  end
end
