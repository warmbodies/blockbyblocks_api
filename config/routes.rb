Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :users, only: [:create] do
        collection do
          post :forgot_password
          post :reset_password
        end
      end
    end
  end
end
