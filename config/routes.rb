Rails.application.routes.draw do
  devise_for :users
  
  root 'trips#new'

  # get '/test_page' => 'test_page#index'
  # post '/trips/:id', to: 'trips#create_default_items_trip', as: :create_default_items_trip
  # get '/trips/:id/activity_items_trip', to: 'trips#activity_items_trip', as: :activity_items_trip
  delete '/trips', to: 'trips#delete_droppable_trip', as: :delete
  get '/calendar' => 'calendar#index'


  resources :trips do
    member do
      get :choose_activities

      put :update_activities
      put :update_default_items
    end

  end

  resources :items
  # resources :calendar

  namespace :api do
    resources :default_items
    resources :custom_items
    resources :trips
  end

end
