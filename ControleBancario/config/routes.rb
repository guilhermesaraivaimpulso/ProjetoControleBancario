Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'
  post '/login' => "home#login", as: :login
  post '/logoff' => "home#logoff", as: :logoff
  resources :usuarios
  resources :cartoes
  resources :debitos
  resources :creditos
end
