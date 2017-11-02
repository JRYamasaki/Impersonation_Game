Rails.application.routes.draw do
  get 'mainpage/mainpage'

  get 'user/login'

  get 'user/registration'

  get 'user/users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
