Rails.application.routes.draw do
  devise_for :users
   resources :books, only: [:index, :new, :create, :destroy]
   root "books#index"
end
