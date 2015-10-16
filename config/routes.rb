Rails.application.routes.draw do

   # devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :sessions => 'sessions'}

   # devise_for :users 
  # match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  # match '/auth/:action/callback' => 'omniauth_callbacks#:action', via: [:get, :post] 
    # match '/auth/facebook/callback' => 'omniauth_callbacks#facebook', via: [:get, :post] 
  resources :users


  get '/test_page' => 'test_page#index'
  # post '/trips/:id', to: 'trips#create_default_items_trip', as: :create_default_items_trip
  # get '/trips/:id/activity_items_trip', to: 'trips#activity_items_trip', as: :activity_items_trip
  delete '/trips', to: 'trips#delete_droppable_trip', as: :delete
  get '/calendar' => 'calendar#index'
  get '/currency' => 'currency#index'
  get '/blog' => 'blog#index'

 # resources :users do
  resources :trips do

    member do
      get :choose_activities
      put :update_activities
      put :update_default_items
    end

  end
 # end


  # namespace :api do
  #   resources :default_items
  #   resources :custom_items
  #   resources :trips
  # end

 root 'trips#new'
 
end
