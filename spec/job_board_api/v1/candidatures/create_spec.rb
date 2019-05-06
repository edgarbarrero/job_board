require 'rails_helper'

RSpec.describe "candidatures#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/job_board_api/v1/candidatures", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:candidature).
        except("created_at", "updated_at")
    end
    let(:payload) do
      {
        data: {
          type: 'candidatures',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CandidatureResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Candidature.count }.by(1)
    end
  end
end
