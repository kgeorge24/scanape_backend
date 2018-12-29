Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :show]
  resources :scans, only: [:index, :create, :show]
  resources :ingredients, only: [:index, :show, :update, :show, :destroy]
  resources :user_ingredients, only: [:create, :show, :index, :destroy]

  get '/current_user', to: "auth#show"
  post '/login', to: "auth#create"
end
