Rails.application.routes.draw do
  root to: 'index#index'

  resources :debug do
    member do
    end

    collection do
    end
  end
end
