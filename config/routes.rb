Rails.application.routes.draw do
  # The "root" url.  <controller>#action
  # In this case the pages controller must have a home action.
  root "pages#home"
  get 'about', to: 'pages#about'

  #Create the routes I need for 'articles'
  #resources provides REST-ful routes to Rails resources
  resources :articles       #, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
