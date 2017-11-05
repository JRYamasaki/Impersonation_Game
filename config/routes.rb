Rails.application.routes.draw do
  

  root 'mainpage#mainpage'
  get 'mainpage/mainpage'

  get 'mainpage/adminmainpage'

  get '/user' => 'user#index'

  post '/users' => 'user#create'

  get '/users' => 'user#users'

  get 'user/new'

  get 'user/login'

  get 'user/registration'

  get 'user/users'

  get 'registration' => 'user#new'

  get 'access/login'

  post 'access/attempt_login'

  get 'access/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
