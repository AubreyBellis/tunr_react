Rails.application.routes.draw do
  namespace :api do
    resources :artists do
      resources :songs, only: [:index, :show]
    end
  end
end
 