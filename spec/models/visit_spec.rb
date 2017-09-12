RSpec.describe Visit, type: :model do
  fixtures [:links, :visits]

  let(:google) { links(:google) }
  let(:visitor_one) { visits(:visitor_one) }

  describe '.create' do
    it 'should require link' do
      visit = Visit.create
      expect(visit.errors.full_messages).to include "Link can't be blank"

      visit = Visit.create link: google
      expect(visit.errors.full_messages).to be_blank
      expect(visit.id).to be
    end
  end

  describe '#link' do
    it 'should return link' do
      expect(visitor_one.link).to eq google
    end
  end
end
