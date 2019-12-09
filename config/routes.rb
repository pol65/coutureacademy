Rails.application.routes.draw do
  root 'lessons#index'
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}, 
              :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  resources :users
  
  resources :lessons do 
    resources :classrooms
  end
  resources :categories, only: [:show]
 
  
  get 'static_pages/contact'
  get 'static_pages/about'
  get 'static_pages/faq'
  get 'static_pages/legal_notice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
