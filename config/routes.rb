Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "questions#index"

  resources :questions, only: [:index, :show, :new, :create, :destroy] do
    resources :answers, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end 

end