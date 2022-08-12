Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  
  resources :users do
    resources :posts do
      resources :comments do
        resources :reactions
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
