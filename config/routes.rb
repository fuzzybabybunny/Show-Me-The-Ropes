ShowMeTheRopes::Application.routes.draw do

  root 'application#index'

  # LOGIN / LOGOUT ROUTING
  get     'login'     => 'session#new'
  post    'login'     => 'session#create'
  delete  'logout'    => 'session#destroy'
  get     'logout'    => 'session#destroy' # delete before deployment

  # RESET PASSWORD ROUTING
  get     'reset/:code' => 'password#edit', as: :reset
  put     'reset/:code' => 'password#update'
  patch   'reset/:code' => 'password#update'

end
