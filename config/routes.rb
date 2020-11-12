# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :books
  resources :collections, except: %i[edit new]
  resources :authors, except: %i[edit new]
  get 'load_pages/:starting_at', to: 'books#load_pages'
  root 'home#index'
end
