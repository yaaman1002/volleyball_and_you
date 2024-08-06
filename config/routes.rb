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
    end

  scope module: :public do
    resources :posts, only:[:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :liked_posts, only:[:create, :destroy, :index]
      resources :comments, only:[:create, :destroy]
    end
    resources :users, only:[:index, :show, :edit, :update] do
      member do
        get :likes
      end
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: 'homes#top'

  get 'homes/about', as: 'about'
  get 'search', to: 'searches#search'
  get 'users/unsubscrible', to: 'users#unsubscrible'
  patch 'users/withdraw', to: 'users#withdraw'
  
end