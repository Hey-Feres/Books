# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resources :books, except: %i[show]
  resources :collections, except: %i[edit new]
  resources :authors, except: %i[edit new]

  get 'user/profile'
  get 'read', to: 'books#read'
  get 'load_pages', to: 'books#load_pages'

  get 'shelf_books/:id', to: 'shelf_books#show'
  post 'shelf_books/create_or_destroy', to: 'shelf_books#create_and_destroy'
  root 'home#index'
end
