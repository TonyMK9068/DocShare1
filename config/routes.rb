Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blogs

  root to: "pages#home"

end
