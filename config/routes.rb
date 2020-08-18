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

  resources :items
    # テスト
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
    # ここまで
  
  end


  resources :categories,only: [:index]
  # after
  root 'items#index'

  resources :credit_cards, only: [:new, :index, :create, :destroy, :show] do

  end
end

