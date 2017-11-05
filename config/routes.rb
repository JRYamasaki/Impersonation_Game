Rails.application.routes.draw do
  get 'mainpage/mainpage'

  get 'mainpage/adminmainpage'

  get '/user' => 'user#index'

  post '/users' => 'user#create'

  get '/users' => 'user#users'

  get 'user/login'

  get 'user/registration'

  get 'user/users'

  get 'registration' => 'user#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
