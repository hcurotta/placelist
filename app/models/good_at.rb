class GoodAt < ActiveRecord::Base
  attr_accessible :timestring

  has_many :lists
end
