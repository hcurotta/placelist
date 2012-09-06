class Subscription < ActiveRecord::Base
  attr_accessible :list_id, :user_id
  
  belongs_to :list
  belongs_to :user
end
