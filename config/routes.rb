Rails.application.routes.draw do


  get 'relationships/followings'
  get 'relationships/followers'
  # get 'book_comments/create'
  # get 'book_comments/destroy'
  # get 'books/new'
  # get 'books/show'
  # get 'books/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "homes#top"
  get "/about" => "homes#about"
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # , only: [:new, :index, :show, :edit, :create, :update , :destroy]
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'
  # get 'users/updata'


end
