JqueryFileuploadRailsExample::Application.routes.draw do
  resources :uploads
  root :to => 'uploads#index'

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

end
