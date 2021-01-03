Rails.application.routes.draw do
  root "pages#home"
  get 'about', to: 'pages#about'

  #Create the routes I need for 'articles'
  resources :articles, only: [:show]
end
