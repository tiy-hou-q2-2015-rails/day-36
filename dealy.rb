puts "Getting you some cards"

# require 'open-uri'
require 'http'

response = Http.get("http://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1")

json = JSON.parse response
hash = json.to_hash

deck_id =  hash["deck_id"]


cards_response = Http.get "http://deckofcardsapi.com/api/deck/#{deck_id}/draw/?count=2"
cards_json = JSON.parse(cards_response)
cards = cards_json.to_hash
cards["cards"].each do |card|
  puts "Drew: #{card["value"]}#{card["suit"]}"
end
