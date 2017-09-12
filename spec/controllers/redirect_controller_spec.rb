RSpec.describe RedirectController, type: :controller do
  fixtures :all

  let(:google) { links(:google) }

  describe '#index' do
    context 'when URL code is valid' do
      it 'should increment visit' do
        expect { get(:index, params: { code: google.short_url_code }) }.to change { google.visits.count }.by(1)
      end

      it 'should redirect to original URL' do
        get :index, params: { code: google.short_url_code }
        expect(response).to redirect_to 'https://google.com'
      end
    end

    context 'when URL code is invalid' do
      it 'should redirect to home ' do
        get :index, params: { code: 'invalid-code' }
        expect(response).to redirect_to root_path
      end
    end
  end
end
