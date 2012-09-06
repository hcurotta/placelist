class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  
  has_many :lists
  
  def self.create_with_omniauth(auth)
    
    create! do |user|
      if auth["provider"]== 'twitter'
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
      elsif auth["provider"]== 'facebook'
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"] 
      end
    end
  end
  
  def firstname
    self.name.split(' ').first
  end
  
  def lastname
    self.name.split(' ').last
  end
  
end
