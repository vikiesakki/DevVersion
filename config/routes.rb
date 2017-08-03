Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  root  'login#index', :via=>[:get,:post]
  resources :employees,:project,:location
  match 'login/login', :to=>'login#login', :via=>[:post]
  match 'login/logout',:to=>'login#logout',:via=>[:get]
  match 'admin', :to=>'admin#index', :via=>[:get]
  match 'user', :to=>'user#index', :via=>[:get]
  match 'members/:id',:to=>"project#members",:via=>[:get]
  match 'members/add_members',:to=>"project#add_members",:via=>[:post]
  match 'members/delete_members',:to=>"project#delete_members",:via=>[:delete]
  match 'upload_documents',:to=>"project#upload_documents",:via=>[:post]
end
