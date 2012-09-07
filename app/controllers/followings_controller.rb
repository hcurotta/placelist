class FollowingsController < ApplicationController

  def new
    Followings.follow(params[:id], current_user.id,)
    
    redirect_to user_path(params[:id])
  end
  
  def destroy
    Followings.unfollow(params[:id],current_user.id)
    
    redirect_to user_path(params[:id])
  end

end