Rails.application.routes.draw do
  resources :videos, only: [:create, :index]
  get '/video-options', to: "application#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
