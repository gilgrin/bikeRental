Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'dashboards#index'
  get '/user' => "dashboards#index", :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes, only: [:index, :show, :new, :create] do
    resources :rentals, only: [:create]
  end
end
