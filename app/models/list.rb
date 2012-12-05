class List < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :good_for_what, :good_on_daystring, :good_at_timestring, :good_when_weather_is
  
  belongs_to :user
  belongs_to :good_for
  belongs_to :good_on
  belongs_to :good_at
  belongs_to :good_when
  
  has_one :list_attribute
  
  has_many :list_items, :order => 'position ASC'
  has_many :venues, :through => :list_items, :order => 'list_items.position ASC'
  has_many :subscriptions



  
  def good_for_what
      good_for.try(:what)
    end
    
  def good_for_what=(what)
    self.good_for = GoodFor.find_or_create_by_what(what) if what.present?
  end
  
  def good_on_daystring
    good_on.try(:daystring)
  end
  
  def good_on_daystring=(daystring)
    self.good_on = GoodOn.find_by_daystring(daystring) if daystring.present?
  end
  
  def good_at_timestring
    good_at.try(:timestring)
  end
  
  def good_at_timestring=(timestring)
    self.good_at = GoodAt.find_by_timestring(timestring) if timestring.present?
  end
  
  def good_when_weather_is
    good_when.try(:weather_is)
  end
  
  def good_when_weather_is=(weather_is)
    self.good_when = GoodWhen.find_by_weather_is(weather_is) if weather_is.present?
  end
  
end
