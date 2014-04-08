ShowMeTheRopes::Application.routes.draw do

  root 'application#index'

  scope :api do
    get '' => "api#index", as: :api, defaults: {format: :json}

    resources :users, defaults: {format: :json} do
      get ':id' => "users#show", on: :collection
    end

    resources :guides, defaults: {format: :json} do
      get ':id' => "guides#show", on: :collection
    end

    resources :pins, defaults: {format: :json} do
      get ':id' => "pins#show", on: :collection
    end

    resources :reviews, defaults: {format: :json} do
      get ':id' => "reviews#show", on: :collection
    end

    resources :rookies, defaults: {format: :json} do
      get ':id' => "rookies#show", on: :collection
    end

  end

end
