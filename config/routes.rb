Rails.application.routes.draw do
  resources :comments
  resources :users
  

	root 'welcome#home'
  resources :beers
  resources :best_beers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
