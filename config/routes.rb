Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :cards, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create, :index, :show]
  end
end
