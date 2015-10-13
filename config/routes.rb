Rails.application.routes.draw do

  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  resources :admin, only: :index do
    get :users_count, on: :collection
  end

  root 'items#index'
end
