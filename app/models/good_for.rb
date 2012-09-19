class GoodFor < ActiveRecord::Base
  attr_accessible :what
  has_many :lists
end
