Rails.application.routes.draw do
  root 'pages#index'
  get 'sessions/new'  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    'nonusershops/nonuser_search_result'
  get    'nonusershops/nonuser_search'
  get    'nonusershops/nonuser_my_shop'
  get    'nonusershops/nonuser_shop'
  resources :users
  resources :topics
  resources :shops do
    get :search, :shop, :my_shop, on: :collection
    get :search_result, on: :collection
  end
  resources :staffs
  resources :nonusers
  resources :nonuserstaffs
  
end 