Rails.application.routes.draw do
  devise_for :users

  root 'images#index'

  resources :images do
    resources :stories
  end
  resources :users do
    resources :stories
  end
  
end
