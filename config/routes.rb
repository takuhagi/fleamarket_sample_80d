Rails.application.routes.draw do
devise_for :users
  resources :confirms,only: [:show] do
    post 'pay'
  end
  resources :users, only: [:show] do
    get 'exhibiting'
    get 'sold'
  end
  # before

  resources :items,only: [:index, :new, :create, :edit, :show]


  
  # after
  root 'items#index'

  resources :credit_cards, only: [:new, :index, :create, :destroy, :show] do

  end
end

