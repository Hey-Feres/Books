# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :books
  resources :collections, except: %i[edit new]
  resources :authors, except: %i[edit new]
  get 'read', to: 'books#read'
  get 'load_pages', to: 'books#load_pages'
  root 'home#index'
end
