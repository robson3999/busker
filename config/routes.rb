Rails.application.routes.draw do
  root "application#index"
  resources :books
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
