class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :email
  
  has_many :lists
  has_many :subscriptions
  
  has_many :followers, :class_name => 'Followings', :foreign_key => 'leader_id'
  has_many :following, :class_name => 'Followings', :foreign_key => 'follower_id'
  
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
        user.email = auth["info"]["email"] 
      end
    end
  end
  
  def self.create_test_user
    create! do |user|
      user.name = "Vicky T"
      user.uid = "1"
      user.email = "Vicky@test.com"
    end
  end
  
  def firstname
    self.name.split(' ').first
  end
  
  def lastname
    self.name.split(' ').last
  end
  
end
