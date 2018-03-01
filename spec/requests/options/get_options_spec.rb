require 'rails_helper'

RSpec.describe 'Options GET API', type: :request do
  let!(:options) {create_list(:option, 10)}
  let(:option_id) { options.first.id }

  describe 'GET /api/v1/options' do
    before { get '/api/v1/options' }

    it 'returns list of options' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/options/#{option_id}' do
    before { get "/api/v1/options/#{option_id}" }

    context 'when the record exists' do
      it 'returns the option' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(option_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/api/v1/options/0' }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Option/)
      end
    end
  end
end
