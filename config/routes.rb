Rails.application.routes.draw do

  post 'authenticate', to: 'authentication#authenticate'
  post 'refresh',      to: 'authentication#refresh'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end
end
