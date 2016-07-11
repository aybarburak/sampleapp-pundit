Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: [:index, :destroy] do
    collection do
      get :send_email
    end
  end
end
