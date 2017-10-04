Rails.application.routes.draw do
  devise_for :users
  root "application#index"
  get "/about" => "application#about"
  resources :books
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
