Rails.application.routes.draw do
  
	get 'signup', to: 'users#new'
	resources :users, except: [:new]
	root 'welcome#home'
  resources :beers

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
