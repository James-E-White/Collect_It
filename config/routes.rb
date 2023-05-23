Rails.application.routes.draw do
  resources :users, only: %i[create show index login] do
   
  end

get '/register', to: 'users#new'
post '/welcome', to: 'welcome#index'
get '/', to: 'welcome#index'
post '/', to: 'users#new'
get '/dashboard', to: 'users#show'
post '/dashboard/search', to: 'comics#search', as: 'search_comics'
get '/login', to: 'users#login_form'
post '/login', to: 'users#login_user'
get '/users/:id', to: 'users#index'
get '/users/:id/discover', to: 'comics#discover', as: 'discover_comics'
post '/users/:id/discover/search', to: 'comics#search', as: 'search_comics_post'
get '/users/:id/comics', to: 'comics#index'
get '/comics/discover', to: 'comics#discover'

end
