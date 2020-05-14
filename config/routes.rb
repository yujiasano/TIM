Rails.application.routes.draw do
  get 'purchase/index'

  get 'purchase/done'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "questions#index"

  resources :questions, only: [:index, :show, :new, :create, :destroy] do
    resources :answers, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
    collection do
      get 'search'
    end
  end 
  resources :cards, only: [:new, :create] do
  end
  
  resources :items, only: [:index, :show] do
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
end