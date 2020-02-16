Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  devise_for :users
 resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'top' => 'homes#top'
end
