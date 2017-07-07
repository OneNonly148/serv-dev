Rails.application.routes.draw do
  root 'static_pages#booking'
  post '/book', to: 'static_pages#create'
end
