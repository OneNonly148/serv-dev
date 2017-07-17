Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root	 'static_pages#home'
  get 	'/book'		, to: 'bookings#booking'
  post 	'/book'		, to: 'bookings#create'
  get 	'/mng'		, to: 'static_pages#management'
  get	'/mngn'		, to: 'management#m_new'
  post  '/mngn'		, to: 'management#create'
  get	'/cusn'		, to: 'customer#c_new'
  post  '/cusn'		, to: 'customer#create'
  get	'/srvn'		, to: 'service_partner#s_new'
  post  '/srvn'		, to: 'service_partner#create'
  get 	'/signup'	, to: 'static_pages#s_signup'
end
