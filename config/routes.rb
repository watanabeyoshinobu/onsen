Rails.application.routes.draw do

  devise_for :users, controllers: {
    # registrations: 'users/registrations',
    # passwords: 'users/passwords'
  }

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end



  resources :blogs do
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'see' => 'blogs#see'
      get 'look' => 'blogs#look'
      get 'saw' => 'blogs#saw'
      get 'watch' => 'blogs#watch'
      get 'seeing' => 'blogs#seeing'
      get 'looking' => 'blogs#looking'
      get 'check' => "blogs#check"
      get "try" => "blogs#try"
      get "gaze" => "blogs#gaze"
      get "info" => "blogs#info"
      get "precautions" => "blogs#precautions"
    end
  end

  resources :users do
    collection do
      get 'withdraw' => 'users#withdraw'
      get 'follows' => 'users#follows'
      get 'followers' => 'users#followers'
    end
    member do
      get 'show_modal' => 'users#show_modal'
    end
  end


  resources :comments, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:create]

  # resources :users, only: [:show, :edit, :update, :create, :destroy, :show_modal]

  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  patch 'users/update'
  get 'comments/create'
  get 'comments/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#browse'
  # 2023/9/7 postからgetに一度変更
  get '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  get 'top' => 'homes#top'
  get 'browse' => 'blogs#browse'
end
