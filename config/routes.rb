Rails.application.routes.draw do
devise_for :users
  resources :confirms,only: [:index] do
    post 'pay'
  end
  # before

  resources :items,only: [:index, :new, :create, :edit, :show] do
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

