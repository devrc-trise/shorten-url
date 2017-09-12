require Rails.root.join('spec', 'controllers', 'api', 'shared_examples.rb')

RSpec.describe Api::LinksController, type: :controller do
  fixtures :all

  describe '#index' do
    context 'when not authenticated' do
      it_behaves_like 'respond to not authenticated', ({ method: :get, action: :index })
    end

    context 'when authenticated' do
      it_behaves_like 'respond to authenticated', ({ method: :get, action: :index })
    end
  end

  describe '#show' do
    google = Link.first

    context 'when not authenticated' do
      it_behaves_like 'respond to not authenticated',
        ({ method: :get, action: :show, params: { id: google.id } })
    end

    context 'when authenticated' do
      it_behaves_like 'respond to authenticated',
        ({ method: :get, action: :show, params: { id: google.id } })
    end

    context 'when given id is invalid' do
      it_behaves_like 'respond to missing',
        ({ method: :get, action: :show, params: { id: 999999 } })
    end
  end

  describe '#create' do
    context 'when not authenticated' do
      it_behaves_like 'respond to not authenticated',
        ({ method: :post, action: :create, params: { link: { original_url: 'http://test.com' } } })
    end

    context 'when authenticated' do
      it_behaves_like 'respond to authenticated',
        ({ method: :post, action: :create, params: { link: { original_url: 'http://test.com' } } })
    end
  end
end
