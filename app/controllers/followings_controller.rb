class FollowingsController < ApplicationController
before_filter :set_user

def set_user
  @user = User.find_by_id(params[:id])
end

  def new
    Followings.follow(params[:id], current_user.id,)
    
    redirect_to user_path(params[:id])
  end
  
  def destroy
    Followings.unfollow(params[:id],current_user.id)
    
    redirect_to user_path(params[:id])
  end
  
  def followers

  end

  def following

  end

end