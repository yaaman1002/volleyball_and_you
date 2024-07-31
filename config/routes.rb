Rails.application.routes.draw do
  scope module: :public do
    devise_for :users
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
  
  get "/search", to: "searches#search"

end