Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :api, format: 'json' do
    resources :links, only: [:index, :create, :show] do
      member do
        get :analytics
      end
      resources :visits, only: [:index]
    end
  end

  # Angular Support
  get 'templates/:path.html' => 'templates#page', constraints: { path: /.+/ }

  get ':code' => 'redirect#index', constraints: { code: /.+/, format: /html/ }
end
