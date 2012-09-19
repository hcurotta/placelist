class ListAttribute < ActiveRecord::Base
  attr_accessible :attr, :list_id
  
  belongs_to :list
  serialize :attr
  
end
