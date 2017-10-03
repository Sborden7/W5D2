Rails.application.routes.draw do

  resources :subs
  resources :posts, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
