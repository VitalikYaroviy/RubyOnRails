Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_for :users, controllers: {sessions: "sessions"}

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # get 'persons/profile', as: 'user_root'

  resources :posts do
    get 'remove_all', :on => :collection
  end

  get 'completed' => 'posts#completed', :as => 'completed'
  get 'select_all' => 'posts#select_all', :as => 'select_all'
  get 'uncheck_all' => 'posts#uncheck_all', :as => 'uncheck_all'
  
end
