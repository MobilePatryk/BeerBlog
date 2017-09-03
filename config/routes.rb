Rails.application.routes.draw do
  
	get 'signup', to: 'users#new'
	resources :users, except: [:new]
	root 'welcome#home'
  resources :beers
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
