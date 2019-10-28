Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users

  resources :cards, only: [:new, :create, :index, :show] do 
    resources :bookings, only: [:new, :create, :index, :show]
  end 

end
