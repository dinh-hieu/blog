Rails.application.routes.draw do

  root 'home#index'
  resources :microposts
  namespace :admin do
    resources :users
    resources :sessions, only:[:new, :create, :destroy]
  end
  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
