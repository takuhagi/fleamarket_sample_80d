Rails.application.routes.draw do
  resources :confirms,only: [:index] do
    post 'pay'
  end
  # before
  get 'items/index'

  # after
  root 'credit_cards#show'

  resources :credit_cards, only: [:new, :index, :create, :destroy, :show] do
    
  end
end

