Rails.application.routes.draw do
  resources :comments
  resources :users
  get 'welcome/home'

	root 'beers#index'
  resources :beers
  resources :best_beers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
