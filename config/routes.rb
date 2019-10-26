Rails.application.routes.draw do
  #get 'users/index'
  root 'home#top'
  get '/home/about' => 'home#about'
  devise_for :users
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
