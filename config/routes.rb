Rails.application.routes.draw do
  root :to => 'deeds#index'

  resources :deeds do
    resources :comments
  end
end
