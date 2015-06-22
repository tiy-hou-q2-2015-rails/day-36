require 'geocoder'
require 'pp'
require 'http'
require 'dotenv'

Dotenv.load

puts "Oh hai! Where do you want to know about the temp?"
location = gets.chomp


latlng = Geocoder.search(location).first.geometry["location"]
lat = latlng["lat"]
lng = latlng["lng"]

# puts "You want to know about #{[lat,lng].join(",")}"

response = Http.get "https://api.forecast.io/forecast/#{ENV.fetch('FORECAST_IO_API_KEY')}/#{lat},#{lng}"
response_json = JSON.parse response
data = response_json.to_hash

puts "Currently in #{location} it is best described as #{data["currently"]["summary"]} and #{data["currently"]["temperature"]} degrees."

data["daily"]["data"].each do |day|
  date = Time.at day["time"]
  puts "#{date.strftime("%A, %b %d").ljust(20)}: #{day["summary"]} ... Max Temp will feel like: #{day["apparentTemperatureMax"]}"
end
