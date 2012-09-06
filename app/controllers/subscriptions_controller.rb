class SubscriptionsController < ApplicationController
  def new
    subscription = Subscription.new
    
    subscription.user_id = current_user.id
    subscription.list_id = params[:id]
    
    subscription.save
    
    redirect_to list_path(params[:id]), notice: "Subscribed to #{params[:name]}"
  end
  
  def destroy
    subscription = Subscription.find_by_list_id_and_user_id(params[:list_id],current_user.id)
    puts subscription
    
    subscription.destroy 
  
    redirect_to list_path(params[:list_id]), notice: "Unsubscribed"
  end
end