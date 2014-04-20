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
  #test

  scope :api do
    get '' => "api#index", as: :api, defaults: {format: :json}

    resources :users, defaults: {format: :json} do
      get ':id' => "users#show", on: :collection
    end

    resources :guides, defaults: {format: :json} do
      get ':id' => "guides#show", on: :collection
    end

    resources :rookies, defaults: {format: :json} do
      get ':id' => "rookies#show", on: :collection
    end

    resources :guide_reviews, defaults: {format: :json} do
      get ':id' => "guide_reviews#show", on: :collection
    end

    resources :rookie_reviews, defaults: {format: :json} do
      get ':id' => "rookie_reviews#show", on: :collection
    end

    resources :pins, defaults: {format: :json} do
      get ':id' => "pins#show", on: :collection
    end

    resources :rookie_messages, defaults: {format: :json} do
      get ':id' => "rookie_messages#show", on: :collection
    end

    resources :guide_messages, defaults: {format: :json} do
      get ':id' => "guide_messages#show", on: :collection
    end



  end

end
