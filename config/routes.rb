Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD

  resources :users do
    resources :transactions, only: %i[index new create show]
  end
=======
  resources :users, only: %i[show]
  resources :transactions, only: [:new, :create]
>>>>>>> d0caebd560ea53724377b629dbf9c8cc539e2e4f
end
