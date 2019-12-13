Rails.application.routes.draw do
  root 'lessons#index'
  
  devise_for :users
  resources :users
  
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  
  resources :lessons do 
    resources :charges
    resources :classrooms
    
  end
  resources :categories, only: [:show]
  
  resources :lessons do 
    resources :comments
  end

  namespace :admin do 
    root 'base#index'
    resources :users 
    resources :lessons
  end

  get 'static_pages/contact'
  get 'static_pages/about'
  get 'static_pages/faq'
  get 'static_pages/legal_notice'
end
