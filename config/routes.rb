Rails.application.routes.draw do
  root 'static_pages#home'
  get '/book', to: 'static_pages#booking'
  post '/book', to: 'static_pages#create'
  get '/mng', to: 'static_pages#management'
  resources :users
end
