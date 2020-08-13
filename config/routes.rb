Rails.application.routes.draw do
devise_for :users
  resources :confirms,only: [:index] do
    post 'pay'
  end
  # before

  resources :items,only: [:index, :new, :create, :edit, :show]


  resources :categories,only: [:index]
  # after
  root 'items#index'

  resources :credit_cards, only: [:new, :index, :create, :destroy, :show] do

  end
end

