Rails.application.routes.draw do
  root :to => 'deeds#index'
  
  resources :deeds
end
