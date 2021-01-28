Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  resources :comments, only: [:create, :destroy]

  	devise_scope :users do
  		get '/users', to: redirect("/users/sign_up")
  	end


  get 'users/show'
  get 'users/index'
  get 'comments/create'
  get 'comments/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'top' => 'homes#top'
  get 'see' => 'blogs#see'
  get 'look' => 'blogs#look'
  get 'saw' => 'blogs#saw'
  get 'watch' => 'blogs#watch'
  get 'seeing' => 'blogs#seeing'
  get 'looking' => 'blogs#looking'
  get 'browse' => 'blogs#browse'
  get 'mypage' => 'users#mypage'
end
