Rails.application.routes.draw do

  resources :lobbies, only: [:new, :create, :show, :index]

  post '/lobby/new' => 'lobby#create'
  get 'lobby' => 'lobby#index'
  get 'lobby/lobby/:id' => 'lobby#lobby'

  mount ActionCable.server => '/cable'

  get 'lobby/lobby'

  get 'lobby/new'

  get 'lobby/show'

  get 'lobby/index'

  root 'mainpage#mainpage'
  get 'mainpage/mainpage'

  get 'mainpage/adminmainpage'

  get '/user' => 'user#index'

  post '/users' => 'user#create'

  get '/users' => 'user#users'

  post '/scores' => 'score#create'

  get 'user/new'

  # get 'user/login'

  get 'user/registration'

  get 'user/users'

  get 'registration' => 'user#new'

  get 'access/login'

  post 'access/attempt_login'

  get 'access/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
