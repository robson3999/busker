# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get :about, to: 'static_pages#about'
  # get '/authors' => 'authors#authors'
  # get '/author/:id' => 'authors#author', as: 'author'
  get '/books/:id/export_to_pdf', to: 'books#export_to_pdf', as: 'export_to_pdf'
  resources :books
  get 'user_songs', to: 'songs#user_songs', as: 'user_songs'
  resources :songs do
    put 'publish', to: 'songs#publish', on: :member
    put 'unpublish', to: 'songs#unpublish', on: :member
  end
  resources :authors
  root 'static_pages#index'
end
