Rails.application.routes.draw do
   devise_for :users
   resources :books
   get "show_all", to: "books#show_all"
   root "home#index"
end
