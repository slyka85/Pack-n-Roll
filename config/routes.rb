Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  get '/blog' => 'blog#index'
  get '/calendar' => 'calendar#index'
  get '/currency' => 'currency#index'
  get '/test_page' => 'test_page#index'
  delete '/trips', to: 'trips#delete_droppable_trip', as: :delete

  resources :users

  resources :trips do
    resources :activities
    member do
      get :choose_activities
      put :update_activities
      put :update_default_items
    end
  end

  root 'trips#new'
end
