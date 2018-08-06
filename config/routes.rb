Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  #get "persons/profile"

  # get 'welcome' => 'welcome#index', :as => 'welcome'

  devise_scope :user do
    root :to => 'devise/registrations#edit'
  end

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

  # devise_for :users, :controllers => {:registrations => "registrations"}

end