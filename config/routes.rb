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
  get     'message'   => 'application#message'
  get     'pindrop'   => 'application#pindrop'

  # REGISTRATION
  get     'register'   => 'register#form'
  post    'register'   => 'register#create'

  # AFTER LOGIN
  get     'admin'     => 'backend#index'

  scope :api, except: [ :show, :new, :edit ], defaults: { format: :json } do
    get '' => "api#index", as: :api

    resources :users do
      get ':id' => "users#show", on: :collection
    end

    resources :guides do
      get ':id' => "guides#show", on: :collection
    end

    resources :rookies do
      get ':id' => "rookies#show", on: :collection
    end

    resources :guide_reviews do
      get ':id' => "guide_reviews#show", on: :collection
    end

    resources :rookie_reviews do
      get ':id' => "rookie_reviews#show", on: :collection
    end

    resources :pins do
      get ':id' => "pins#show", on: :collection
    end

    resources :rookie_messages do
      get ':id' => "rookie_messages#show", on: :collection
    end

    resources :guide_messages do
      get ':id' => "guide_messages#show", on: :collection
    end



  end

end
