Rails.application.routes.draw do
  devise_for :users
  root "application#index"
  get "/about" => "application#about"
  get "/books/:id/export_to_pdf" => "books#export_to_pdf", as: "export_to_pdf"
  resources :books
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
