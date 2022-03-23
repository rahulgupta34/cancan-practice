Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end

  devise_for :users
  root 'home#index'
 
  # root "articles#index"
end
