Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/top'
  root 'posts#index'
  


  resources :posts
  resources :authors
  resources :categories



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
