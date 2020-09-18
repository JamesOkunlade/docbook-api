Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  # get '/specialties', to: 'specialties#index'
  # post '/specialties', to: 'specialties#create'
  # put '/specialties', to: 'specialties#update',
  # delete '/specialties', to: 'specialties#destroy'

  # get '/doctors', to: 'doctors#index'
  # post '/doctors', to: 'doctors#create'
  # get '/doctors/:id', to: 'doctors#show'
  # put '/doctors/:id', to: 'doctors#update'
  # delete '/doctors/:id', to: 'doctors#destory'

  # post '/appointments', to: 'appointments#create'
  # put '/appointments/:id', to: 'appointments#update'
  # delete '/appointments/:id', to: 'appointments#destroy'
  
  
  
  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :doctors, only: [:index, :create, :show, :update, :destroy]
    resources :specialties, only: [:index, :create, :update, :destroy]
    resources :appointments, only: [:create, :update, :destroy]
    get '/users/:id/appointments', to: 'appointments#index'
    get '/doctors/:id/appointments', to: 'appointments#index'
  end

  resources :users, only: [:index, :show, :update, :destroy]
  
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'


  

end
