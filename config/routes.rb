TenPlaces::Application.routes.draw do
  
  resources :list_items

  root :to => "Pages#home"
  
  resources :lists

  resources :venues, :except => :create
  post "/venue" => "venues#create", :as => :create_venue
  get "/venue/select" => "venues#select", :as => :select_venue

  resources :users
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  post "/search" => "venues#search", :as => :venue_search
  get  "/discover" => "pages#discover", :as => :discover
  post  "/subscribe" => "subscriptions#new", :as => :subscribe
  delete "/subscribe" => "subscriptions#destroy", :as => :unsubscribe
  
  match "/test_login" => "sessions#create_test", :as => :test_login
  
  post  "/follow" => "followings#new", :as => :follow
  delete "/follow" => "followings#destroy", :as => :unfollow
  
  get "/good_fors" => "GoodFors#index", :as => :goodfor

  get "/users/:id/followers" => "Followings#followers", :as => :followers
  get "/users/:id/following" => "Followings#following", :as => :following
  
end
