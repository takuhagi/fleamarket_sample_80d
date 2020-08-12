Rails.application.routes.draw do
  resources :confirms,only: [:index] do
    post 'pay'
  end
  # before
  resources :items,only: [:index]

  # after
  root 'items#index'

  resources :credit_cards, only: [:new, :index, :create, :destroy, :show] do
    
  end
end

