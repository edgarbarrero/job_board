require 'rails_helper'

RSpec.describe "candidatures#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/job_board_api/v1/candidatures", params: params
  end

  describe 'basic fetch' do
    let!(:candidature1) { create(:candidature) }
    let!(:candidature2) { create(:candidature) }

    it 'works' do
      expect(CandidatureResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['candidatures'])
      expect(d.map(&:id)).to match_array([candidature1.id, candidature2.id])
    end
  end
end
