Rails.application.routes.draw do
resources :confirms
# before
get 'items/index'

# # after
root 'items#index'


end

