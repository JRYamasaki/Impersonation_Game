Rails.application.routes.draw do

  resources :responses

  # post 'lobby/show/:id' => 'response#create'
  # resources :lobbies, only: [:new, :create, :show, :index]

   #post '/lobby/create' => 'lobby#create'
  # get 'lobby/lobby/:id' => 'lobby#lobby'

  mount ActionCable.server => '/cable'

  get 'lobby/index'
  get 'lobby/show'
  get 'lobby/new'
  post 'lobby/create'
  get 'lobby' => 'lobby#index'
  get 'lobby/lobby'
  get 'lobby/decrement_user_count/:id', to: "lobby#decrement_user_count"
  get 'lobby/update_player_count/:id', to: "lobby#update_player_count"

  get 'lobby/display_bot_message/:id', to: 'lobby#display_bot_message'
  get 'lobby/click_wrong_response/:id', to: 'lobby#click_wrong_response'
  get 'lobby/click_right_response/:id', to: 'lobby#click_right_response'

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
  get 'user/purge_db'

  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
