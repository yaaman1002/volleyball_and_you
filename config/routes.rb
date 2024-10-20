Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:regisrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy, :edit, :update]
    resources :posts, only: [:index, :destroy, :edit, :update]
    resources :comments, only: [:index, :destroy]
    end

  scope module: :public do
    resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :likes, only: [:create, :destroy,]
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update,] do
      member do
         get :likes
        end
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'

      resource :messages, only: [:create]
      get 'messages' => 'messages#message', as: 'message'

      member do
        get 'unsubscribe'
        patch 'withdraw'
      end
   end
    resources :notifications, only: [:update]
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: 'homes#top'

  get 'homes/about', as: 'about'
  get 'search', to: 'searches#search'

end