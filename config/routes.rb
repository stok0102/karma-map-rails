Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => 'deeds#index'
  devise_for :users, controllers: {}
  resources :accounts
  resources :deeds do
    resources :comments
  end
end
