TenPlaces::Application.routes.draw do
  
  resources :list_items

  root :to => "Pages#home"
  
  resources :lists

  resources :venues, :except => :create
  post "/venue" => "venues#create", :as => :create_venue
  

  resources :users
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  post "/search" => "venues#search", :as => :venue_search
  

end
