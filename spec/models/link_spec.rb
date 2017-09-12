RSpec.describe Link, type: :model do
  fixtures [:links, :visits]

  let(:google) { links(:google) }

  describe '.create' do
    it 'should generate short url code' do
      link = Link.create original_url: 'http://test.com'
      expect(link.short_url_code).to be
    end

    it 'should require original_url' do
      link = Link.create
      expect(link.errors.full_messages).to include "Original url can't be blank"
    end
  end

  describe '#redirect_url' do
    it 'should return the original url' do
      link = Link.create original_url: 'http://test.com'
      expect(link.redirect_url).to eq link.original_url
    end

    it 'should return the original url with http scheme' do
      link = Link.create original_url: 'test.com'
      expect(link.redirect_url).to eq 'http://test.com'
    end
  end

  describe '#visits' do
    it 'should return visits' do
      visits = google.visits
      expect(visits.count).to be > 0
    end
  end
end
