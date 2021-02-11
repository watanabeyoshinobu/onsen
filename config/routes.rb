Rails.application.routes.draw do

  devise_for :users

  get 'users/:id/profile', to: 'users#show', as: 'user_profile'

  resources :blogs do
    collection do
      get 'see' => 'blogs#see'
      get 'look' => 'blogs#look'
      get 'saw' => 'blogs#saw'
      get 'watch' => 'blogs#watch'
      get 'seeing' => 'blogs#seeing'
      get 'looking' => 'blogs#looking'
    end
  end

  resources :users do
    collection do
      get 'withdraw' => 'users#withdraw'
    end
  end

  resources :comments, only: [:create, :destroy]

  	devise_scope :users do
  		get '/users', to: redirect("/users/sign_up")
  	end


  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'comments/create'
  get 'comments/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'top' => 'homes#top'
  get 'browse' => 'blogs#browse'
end
