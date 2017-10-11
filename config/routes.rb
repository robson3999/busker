Rails.application.routes.draw do
  devise_for :users
  root 'application#index'
  get '/about' => 'application#about'
  # get '/authors' => 'authors#authors'
  # get '/author/:id' => 'authors#author', as: 'author'
  get '/books/:id/export_to_pdf' => 'books#export_to_pdf', as: 'export_to_pdf'
  resources :books
  get 'user_songs' => 'songs#user_songs', as: 'user_songs'
  resources :songs do
    put 'publish' => 'songs#publish', on: :member
    put 'unpublish' => 'songs#unpublish', on: :member
  end
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
