# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: 'api/v1/auth/sessions',
        registrations: 'api/v1/auth/registrations'
      }

      get 'acount' => 'acount#show'
      
      resources :pages
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
