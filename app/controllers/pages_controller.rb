class PagesController < ApplicationController
  
  require 'open-uri'

def home
  if current_user
    redirect_to "/users/#{current_user.id}"
  end
end

def discover
  @lists = List.all
  
  weather_json = open("http://api.wunderground.com/api/#{ENV["wunderground_key"]}/geolookup/conditions/q/#{params[:lat]},#{params[:long]}.json").read
  
  weather = JSON.parse(weather_json)["current_observation"]
  
  @condition = weather["weather"]
  @temperature = weather["temp_c"]
  
  t = Time.now

  @time_now = case t.hour
    when 0..6 then "Early hours"
    when 7..11 then "Morning"
    when 12..16 then "Afternoon"
    when 17..19 then "Evening"
    when 20..23 then "Nighttime"
  end  
    
  @time_now = t.strftime("%A") +" in the "+ @time_now
  
end

end