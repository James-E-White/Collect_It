Rails.application.routes.draw do
  resources :users, only: %i[create show index] do
    collection do
      get 'login'
    end

    resources :comics, only: [:index] do
      member do
        post 'add_to_collection', to: 'users#add_to_collection', as: 'add_to_collection'
      end

      collection do
        get 'search', to: 'comics#search', as: 'search_user_comics'
      end
    end
  end
 
  get '/comics', to: 'comics#index'

  post 'discover/search', to: 'comics#search', as: 'search_comics_post'
  match '/logout', to: 'users#logout_user', via: [:get, :post], as: 'logout'
  get '/register', to: 'users#new'
  post '/welcome', to: 'welcome#index'
  get '/', to: 'welcome#index'
  post '/', to: 'users#new'
  get '/dashboard', to: 'users#show'
  post '/dashboard/search', to: 'dashboard#search', as: 'dashboard_search'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  get '/users/:id', to: 'users#index'
  get '/users/:id/discover/comics', to: 'comics#discover', as: 'user_discover_comics'
  get '/users/:id/discover/search', to: 'comics#search', as: 'user_dashboard_search'
  get '/users/:id/comics', to: 'comics#index'
end
