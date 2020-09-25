Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :doctors, only: [:index, :create, :show, :update, :destroy]
    resources :specialties, only: [:index, :create, :update, :destroy]
    resources :appointments, only: [:create, :update, :destroy]
    get '/appointments', to: 'appointments#index'
    get '/users/:id/appointments', to: 'appointments#user_appointments'
    get '/doctors/:id/appointments', to: 'appointments#doctor_appointments'
  end

  resources :users, only: [:index, :show, :update, :destroy]
  
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
