Rails.application.routes.draw do
resources :confirms,only: :index
# before
get 'items/index'

# # after
root 'items#index'


end

