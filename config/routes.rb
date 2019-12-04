Rails.application.routes.draw do
  root 'lesson#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lesson
  resources :static_pages

end
