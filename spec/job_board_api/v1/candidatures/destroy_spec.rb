require 'rails_helper'

RSpec.describe "candidatures#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/job_board_api/v1/candidatures/#{candidature.id}"
  end

  describe 'basic destroy' do
    let!(:candidature) { create(:candidature) }

    it 'updates the resource' do
      expect(CandidatureResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Candidature.count }.by(-1)
      expect { candidature.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
