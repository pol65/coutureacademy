Rails.application.routes.draw do
  root 'lessons#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users
  
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  
  resources :lessons do 
    resources :classrooms
  end
  resources :categories, only: [:show]
 
  
  get 'static_pages/contact'
  get 'static_pages/about'
  get 'static_pages/faq'
  get 'static_pages/legal_notice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lessons




  namespace :admin do 
    root 'base#index'
    resources :users , except: [:show]
    resources :lessons
  end

end
