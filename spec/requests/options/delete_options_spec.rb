require 'rails_helper'

RSpec.describe 'Options DELETE API', type: :request do
  let!(:options) {create_list(:option, 5)}
  let(:option_id) { options.first.id }

  describe 'Delete /api/v1/options/#{option_id}' do
    before { delete "/api/v1/options/#{option_id}"}

    it "returns a 204 status code" do
      expect(response).to have_http_status(204)
    end
  end
end
