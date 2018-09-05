Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users do
    resources :post
  end

  resources :posts

  delete 'destroy_multiple' => 'posts#destroy_multiple', :as => 'destroy_multiple'
  get 'done' => 'posts#done', :as => 'done'
end
