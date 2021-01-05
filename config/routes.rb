Rails.application.routes.draw do
  root "pages#home"
  get 'about', to: 'pages#about'

  #Create the routes I need for 'articles'
  #resources provides REST-ful routes to Rails resources
  resources :articles       #, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
