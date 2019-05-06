require 'rails_helper'

RSpec.describe "candidatures#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/job_board_api/v1/candidatures/#{candidature.id}", payload
  end

  describe 'basic update' do
    let!(:candidature) { create(:candidature) }

    let(:payload) do
      {
        data: {
          id: candidature.id.to_s,
          type: 'candidatures',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CandidatureResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { candidature.reload.attributes }
    end
  end
end
