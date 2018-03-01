require 'rails_helper'

RSpec.describe 'Options PUT API', type: :request do
  let!(:options) {create_list(:option, 5)}
  let(:option_id) { options.first.id }

  describe 'PUT /api/v1/options/#{option_id}' do
    let(:valid_option_attributes) { { name: 'air conditioning' } }

    context "when the record exists with valid attributes" do
      before { put "/api/v1/options/#{option_id}", params: valid_option_attributes }

      it "updates an option" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end

    context "when the record does not exist" do
      before {put '/api/v1/options/0' }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Vehicle/)
      end
    end

  end
end
