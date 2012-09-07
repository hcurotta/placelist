class Followings < ActiveRecord::Base
  attr_accessible :follower_id, :leader_id
  
  belongs_to :leader, :class_name => 'User'
  belongs_to :follower, :class_name => 'User'
  
  
  def self.follow(leader_id, follower_id)
    create! do |following|
      following.leader_id = leader_id
      following.follower_id = follower_id
    end
  end
  
  def self.unfollow(leader_id, follower_id)
    follower = Followings.find_by_leader_id_and_follower_id(leader_id, follower_id)
    follower.destroy
  end
  
end
