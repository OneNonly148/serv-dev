Rails.application.routes.draw do
  root	'static_pages#test'
  get   '/test/load_car_makes', to: 'static_pages#load_car_makes'
  get   '/test/load_car_models', to: 'static_pages#load_car_models'
  get   '/test/load_region', to: 'static_pages#load_region'
  get   '/test/load_locate', to: 'static_pages#load_locate'
  get   '/test/load_pack', to: 'static_pages#load_pack'
  get   '/test/save', to: 'static_pages#test_save'
  get   '/test/mail', to: 'static_pages#test_mail'
  get   'test/load_promo', to: 'static_pages#load_promo'

  get   '/book/load_car_makes'  , to: 'bookings#load_car_makes'
  get   '/book/load_car_models' , to: 'bookings#load_car_models'
  get   '/book/load_region'     , to: 'bookings#load_region'
  get   '/book/load_locate'     , to: 'bookings#load_locate'
  get 	'/book'		, to: 'bookings#booking'
  post 	'/book'		, to: 'bookings#create'
  get 	'/mng'		, to: 'static_pages#management'
  get	  '/mngn'		, to: 'management#m_new'
  post  '/mngn'		, to: 'management#create'
  get	  '/cusn'		, to: 'customer#c_new'
  post  '/cusn'		, to: 'customer#create'
  get	  '/srvn'		, to: 'service_partner#s_new'
  post  '/srvn'		, to: 'service_partner#create'
  get 	'/signup'	, to: 'static_pages#s_signup'
  get 	'/login'	, to: 'static_pages#s_login'
  get   '/mngl'   , to:  'management#m_session'
  post  '/mngl'   , to: 'management#mngl'
  get   '/cusl'   , to:  'customer#c_session'
  post  '/cusl'   , to: 'customer#cusl'
  get   '/srvl'   , to:  'service_partner#s_session'
  post  'srvl'    , to: 'service_partner#srvl'
  get   '/logout' , to: 'management#destroy'
  get   '/book_mng',to: 'static_pages#booking_mng'
  delete '/del_pack', to: 'static_pages#destroy'
  get '/book/save_pack', to: 'static_pages#create'
end
