Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  root  'login#index', :via=>[:get,:post]
  match 'login/login', :to=>'login#login', :via=>[:post]
  match 'users', :to => 'user#index', :via => [:get,:post]
  match 'create-user', :to => 'user#create', :via => [:get,:post]
  #get 'user/new'
  match 'register', :to => 'user#new', :via => [:get,:post]
end
