Rails.application.routes.draw do
  devise_for :users

  	devise_scope :users do
  		get '/users', to: redirect("/users/sign_up")
  	end

  resources :blogs
  get 'users/show'
  get 'users/index'
  post 'blogs' => 'blogs#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'top' => 'homes#top'
  get 'see' => 'blogs#see'
end
