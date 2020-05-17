Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages, only: [:index] do
    resources :bikes, only: [:index, :show] do
    end
  end
  resources :bikes, only: [:index, :show, :new, :create] do
    resources :rentals, only: [:create]
    end
end
