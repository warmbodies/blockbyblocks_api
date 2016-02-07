Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'api/v1/login' }, controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/users' }

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update] do
        collection do
          post :forgot_password
          post :reset_password
        end

        resources :appointments, only: [:index]
      end
    end
  end
end
