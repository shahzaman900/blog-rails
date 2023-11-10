Rails.application.routes.draw do
   root "users#index"
   resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end


  # get "up" => "rails/health#show", as: :rails_health_check"
end
