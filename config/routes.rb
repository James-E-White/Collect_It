Rails.application.routes.draw do
  resources :users do
    resources :comics do
      post 'add_to_collection', on: :member
      get 'login'
    end

    member do
      get 'discover', to: 'comics#discover', as: 'user_discover_comics'
    end

    resources :comics, only: %i[index show new create] do
      member do
        post 'add_to_collection'
      end
    end
  end

  post 'comics/:id/add_to_collection', to: 'comics#add_to_collection', as: 'add_to_collection_comic'

  post '/discover/search', to: 'comics#search', as: 'search_comics_post'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  match '/logout', to: 'users#logout_user', via: %i[get post], as: 'logout'
  get '/register', to: 'users#new'
  post '/welcome', to: 'welcome#index'
  get '/', to: 'welcome#index'
  get '/dashboard', to: 'users#show'
  post '/dashboard/search', to: 'dashboard#search', as: 'dashboard_search'

  get '/users/:id/discover/comics', to: 'comics#discover', as: 'user_discover_comics'
  get '/users/:id/discover/search', to: 'comics#search', as: 'user_dashboard_search'
  get '/users/:id/comics', to: 'comics#index'
end
