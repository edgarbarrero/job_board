require 'rails_helper'

RSpec.describe JobResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'jobs',
          attributes: attributes_for(:job).
            except("created_at", "updated_at")
        }
      }
    end

    let(:instance) do
      JobResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Job.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:job) { create(:job) }

    let(:payload) do
      {
        data: {
          id: job.id.to_s,
          type: 'jobs',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      JobResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { job.reload.updated_at }
      # .and change { job.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:job) { create(:job) }

    let(:instance) do
      JobResource.find(id: job.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Job.count }.by(-1)
    end
  end
end
