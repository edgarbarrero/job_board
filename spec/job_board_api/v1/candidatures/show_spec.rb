require 'rails_helper'

RSpec.describe "candidatures#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/job_board_api/v1/candidatures/#{candidature.id}", params: params
  end

  describe 'basic fetch' do
    let!(:candidature) { create(:candidature) }

    it 'works' do
      expect(CandidatureResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('candidatures')
      expect(d.id).to eq(candidature.id)
    end
  end
end
