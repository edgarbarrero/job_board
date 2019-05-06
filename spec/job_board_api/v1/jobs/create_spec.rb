require 'rails_helper'

RSpec.describe "jobs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/job_board_api/v1/jobs", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:job).
        except("created_at", "updated_at")
    end
    let(:payload) do
      {
        data: {
          type: 'jobs',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(JobResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Job.count }.by(1)
    end
  end
end
