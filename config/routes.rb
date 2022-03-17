Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :transactions, only: %i[index new create show edit update destroy]
    resources :goals, only: %i[new create]
  end

  resources :stats, only: %i[index]
end
