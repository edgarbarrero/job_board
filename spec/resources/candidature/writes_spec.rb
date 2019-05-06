require 'rails_helper'

RSpec.describe CandidatureResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'candidatures',
          attributes: attributes_for(:candidature).
            except("created_at", "updated_at")
        }
      }
    end

    let(:instance) do
      CandidatureResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Candidature.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:candidature) { create(:candidature) }

    let(:payload) do
      {
        data: {
          id: candidature.id.to_s,
          type: 'candidatures',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CandidatureResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { candidature.reload.updated_at }
      # .and change { candidature.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:candidature) { create(:candidature) }

    let(:instance) do
      CandidatureResource.find(id: candidature.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Candidature.count }.by(-1)
    end
  end
end
