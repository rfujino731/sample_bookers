Rails.application.routes.draw do


  get 'books/new'
  get 'books/show'
  get 'books/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "homes#top"
  get "/about" => "homes#about"
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :books
  # , only: [:new, :index, :show, :edit, :create, :update , :destroy]
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'
  # get 'users/updata'


end
