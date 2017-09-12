require Rails.root.join('spec', 'controllers', 'api', 'shared_examples.rb')

RSpec.describe Api::VisitsController, type: :controller do
  fixtures :all

  describe '#index' do
    google = Link.first
    context 'when not authenticated' do
      it_behaves_like 'respond to not authenticated', ({ method: :get, action: :index, params: { link_id: google.id } })
    end

    context 'when authenticated' do
      it_behaves_like 'respond to authenticated', ({ method: :get, action: :index, params: { link_id: google.id } })
    end

    context 'when link id is invalid' do
      it_behaves_like 'respond to missing', ({ method: :get, action: :index, params: { link_id: 999999 } })
    end
  end
end
