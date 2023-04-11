Rails.application.routes.draw do
  resources :users, only: %i[create show index] do
   
  end
  get '/register', to: 'users#new'
  get '/', to: 'welcome#index'
  #post '/', to: 'users#new'
 
  #post '/dashboard', to: 'users/show'
  post '/login', to: 'users#show'
  post '/users/:id', to: 'users#show'
  get '/users/:id', to: 'users#index'
  get '/users/:id/discover', to: 'comics#discover'
  post '/users/:id/discover', to: 'comics#discover'
  get '/users/:id/comics', to: 'comics#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
