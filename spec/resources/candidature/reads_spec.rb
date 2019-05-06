require 'rails_helper'

RSpec.describe CandidatureResource, type: :resource do
  describe 'serialization' do
    let!(:candidature) { create(:candidature) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(candidature.id)
      expect(data.jsonapi_type).to eq('candidatures')
    end
  end

  describe 'filtering' do
    let!(:candidature1) { create(:candidature) }
    let!(:candidature2) { create(:candidature) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: candidature2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([candidature2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:candidature1) { create(:candidature) }
      let!(:candidature2) { create(:candidature) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            candidature1.id,
            candidature2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            candidature2.id,
            candidature1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
