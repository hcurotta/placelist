class List < ActiveRecord::Base
  attr_accessible :description, :list_item_id, :name, :user_id
  
  belongs_to :user
  
  has_many :list_items
  has_many :venues, :through => :list_items
  has_many :subscriptions
end
