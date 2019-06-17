Rails.application.routes.draw do
  root to: 'index#index'

  resources :debug do
    member do
    end

    collection do
      get :all
    end
  end
end
