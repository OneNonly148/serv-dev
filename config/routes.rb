Rails.application.routes.draw do
  root	 'bookings#booking'
  get 	'/book'		, to: 'bookings#booking'
  get   '/book/load_car_makes', to: 'bookings#load_car_makes'
  get   '/book/load_car_models', to: 'bookings#load_car_models'
  get   '/book/load_region', to: 'bookings#load_region'
  get   '/book/load_locate', to: 'bookings#load_locate'
  post 	'/book'		, to: 'bookings#create'
  get 	'/mng'		, to: 'static_pages#management'
  get	'/mngn'		, to: 'management#m_new'
  post  '/mngn'		, to: 'management#create'
  get	'/cusn'		, to: 'customer#c_new'
  post  '/cusn'		, to: 'customer#create'
  get	'/srvn'		, to: 'service_partner#s_new'
  post  '/srvn'		, to: 'service_partner#create'
  get 	'/signup'	, to: 'static_pages#s_signup'
  get 	'/login'	, to: 'static_pages#s_login'
  get   '/mngl' ,to:  'management#m_session'
  post '/mngl', to: 'management#mngl'
  get '/cusl', to:  'customer#c_session'
  post '/cusl', to: 'customer#cusl'
  get '/srvl', to:  'service_partner#s_session'
  post 'srvl', to: 'service_partner#srvl'
  get '/logout', to: 'management#destroy'
end
