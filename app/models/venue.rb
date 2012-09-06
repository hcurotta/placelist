class Venue < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :foursquareid, :address, :city
  
  has_many :list_items
  
end
