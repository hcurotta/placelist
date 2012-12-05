class ListItem < ActiveRecord::Base
  attr_accessible :description, :list_id, :venue_id
  
  belongs_to :venue
  belongs_to :list
  
  acts_as_list :scope => :list
end
