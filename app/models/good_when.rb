class GoodWhen < ActiveRecord::Base
  attr_accessible :weather_is
  has_many :lists
end
