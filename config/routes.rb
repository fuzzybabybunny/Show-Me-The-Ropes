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

  get     'profile'   => 'application#profile'
  get     'pindrop'   => 'application#pindrop'

  # MESSAGING
  get     'message'   => 'messages#index'
  post    'message'   => 'messages#create'

  # REGISTRATION
  get     'register'   => 'register#form'
  post    'register'   => 'register#create'

  # AFTER LOGIN
  get     'admin'     => 'backend#index'

  # # CURRENT USER
  # patch "current_user" => 'users#update' {:format => :json}
  # delete "current_user" => 'users#destroy' {:format => :json}

  scope :api, except: [ :new, :edit ], defaults: { format: :json } do
    get '' => "api#index", as: :api

    resources :users
    get "current_user" => 'users#current_user'

    resources :guides

    resources :rookies

    resources :guide_reviews

    resources :rookie_reviews

    resources :pins

    resources :rookie_messages

    resources :guide_messages



  end

end
