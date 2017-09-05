Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    resources :artists do
      resources :songs, only: [:index, :show]
    end
  end
end
 