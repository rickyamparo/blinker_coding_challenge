require 'rails_helper'

RSpec.describe 'Options POST API', type: :request do

  describe "POST /api/v1/vehicles" do
    let(:valid_option_attributes) { { name: 'air conditioning'} }
    
    context 'when the record is valid' do
      before { post '/api/v1/options', params: valid_option_attributes}

      it "creates an option" do
        expect(json['name']).to eq('air conditioning')
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the record is invalid' do
      before { post '/api/v1/options', params: { title: 'air conditioning' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns an invalid record message' do
        expect(response.body).to match(/Validation failed:/)
      end
    end
  end
end
