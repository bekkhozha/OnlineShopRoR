Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :products
  root "products#index"

end
