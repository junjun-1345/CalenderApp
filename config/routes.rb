Rails.application.routes.draw do
  get 'events/index'
  devise_for :users
  root to: "home#top"
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
