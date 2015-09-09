Rails.application.routes.draw do
  get 'welcome/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  root 'welcome#index'

  resources :users
  resources :drafts do
    resources :teams
  end


end
