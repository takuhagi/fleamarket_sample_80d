Rails.application.routes.draw do
resources :confirms,only: :show
# before
get 'items/index'

# # after
root 'items#index'


end

