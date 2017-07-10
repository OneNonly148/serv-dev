Rails.application.routes.draw do
  root 'static_pages#home'
  get '/book', to: 'static_pages#booking'
  post '/book', to: 'static_pages#create'
  get '/mng', to: 'static_pages#management'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'	
  resources :users
  resources :static_pages do
	member do
		get 'customer'
		get 'service_partner'
	end
  end
end
