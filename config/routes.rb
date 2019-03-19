Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  
end
