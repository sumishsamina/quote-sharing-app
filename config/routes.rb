Rails.application.routes.draw do
  #get 'search/index'
  resources :quotes
  resources :categories
  resources :philosophers
  resources :users
  #get 'about/index'
  #get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get '/about', to: 'about#index'
  get 'search', to: 'search#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'home#uquotes'

end
