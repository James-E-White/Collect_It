Rails.application.routes.draw do
  resources :users, only: %i[create show index] do
   
  end
  get '/register', to: 'users#new'
  get '/', to: 'welcome#index'
  post '/', to: 'users#new'
  get "/register", to: 'users#new'
  get 'users/show'
  get 'users/#{user.id}', to: 'users#index'
  get 'users/#{user.id}/discover', to: 'comics#discover'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
