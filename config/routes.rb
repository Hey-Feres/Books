Rails.application.routes.draw do
   devise_for :users
   resources :books
   resources :collections, except: %i[edit new]
   resources :authors, except: %i[edit new]
   get "show_all", to: "books#show_all"
   root "home#index"
end
