Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  #get "persons/profile"

  get 'welcome' => 'welcome#index', :as => 'welcome'

  root :to => 'posts#index'

  # get 'persons/profile', as: 'user_root'

  # resources :posts
  resources :users do
    resources :post
  end

  resources :posts do
    get 'remove_all', :on => :collection
  end


  get 'completed' => 'posts#completed', :as => 'completed'
  get 'select_all' => 'posts#select_all', :as => 'select_all'
  get 'uncheck_all' => 'posts#uncheck_all', :as => 'uncheck_all'

end