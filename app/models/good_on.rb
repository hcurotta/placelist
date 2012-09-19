class GoodOn < ActiveRecord::Base
  attr_accessible :daystring
  has_many :lists
end
