Rails.application.routes.draw do
resources :confirms,only: :show
# before
get 'items/index'

# after
root 'credit_cards#new'

resources :credit_cards, only: [:new, :index, :create, :destroy]


end

