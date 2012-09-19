# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create all the days

days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "weekdays", "weekends", "any day"]

days.each do |day|
  daysgood = GoodOn.new
  daysgood.daystring = day
  daysgood.save
end

# create all the weather conditions
conditions = ["doing whatever", "Hot", "Chilly", "Warm", "Cool", "Scorching", "Rainy", "Snowy"]

conditions.each do |weather|
  weathergood = GoodWhen.new
  weathergood.weather_is = weather
  weathergood.save
end

# create all the times
times = ["Afternoon", "Morning", "Midday", "Evening", "Night", "Late", "Midnight", "Early hours"]

times.each do |time|
  timegood = GoodAt.new
  timegood.timestring = time
  timegood.save
end

