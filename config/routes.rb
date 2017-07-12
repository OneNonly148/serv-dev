Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'static_pages#home'
  get '/book', to: 'bookings#booking'
  post '/book', to: 'bookings#create'
  get '/mng', to: 'static_pages#management'
  get '/sp', to: 'static_pages#service'
  get '/cs', to: 'static_pages#customer'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'	
  get '/s_list', to: 'users#s_list'
  get '/s_deploy', to: 'users#s_deploy'
  resources :users do
	member do
		get :grant
		get :demote
	end
  end
end
