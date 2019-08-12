Rails.application.routes.draw do
  get 'resenha/new'
  get 'resenha/edit'
  get 'resenha/show'
   devise_for :users
   resources :books
   get "show_all", to: "books#show_all"
   root "books#index"
end
