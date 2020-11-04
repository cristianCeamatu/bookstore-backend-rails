# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  resources :books
  root 'books#index'
end
