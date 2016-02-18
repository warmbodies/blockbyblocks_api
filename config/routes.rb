Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'api/v1/login' }, controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/users' }

  namespace :api do
    namespace :v1 do
      get 'current_users', to: 'sessions#current_users'

      resources :users, only: [:create, :show, :update] do
        collection do
          post :forgot_password
          post :reset_password
        end

        resources :appointments, only: [:index]
      end
    end
  end
end
