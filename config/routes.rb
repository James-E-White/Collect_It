Rails.application.routes.draw do
  resources :users, only: %i[create show] do
   
  end
  get '/register', to: 'users#new'
  get '/welcome', to: 'welcome#index'
  post 'welcome', to: 'users#new'
  get "/", to: 'users#new'
  get 'user/show'
  get 'user/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
