Rails.application.routes.draw do
  devise_for :users

  root 'stories#index'

  resources :images do
    resources :contributions
  end
  resources :users do
    resources :contributions
  end
  resources :stories do
    resources :contributions
  end

end
