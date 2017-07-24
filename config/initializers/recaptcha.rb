# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key  = '6LcXOioUAAAAAHX-M1So3YLi0lSRKuf9gGv4qF5F'
  config.secret_key = '6LcXOioUAAAAANksjPO6vhmS2owNTTuWBUrdi1Nf'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end
