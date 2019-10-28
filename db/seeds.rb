require 'json'
require 'open-uri'

def generateCards
 for i in (1..50) do
    id = rand(1..4880)
    url = "https://api.magicthegathering.io/v1/cards/#{id}"
    cards_serialized = open(url).read
    cards = JSON.parse(cards_serialized)

    cards.each do |element|
      new_card = Card.create(name: element[1]["name"], color: element[1]["colors"][0], cmc: element[1]["cmc"].to_s, power: element[1]["power"] , toughness: element[1]["toughness"], image_url: element[1]["imageUrl"], price_per_week: rand(5..200))
      puts new_card
    end
    puts " #{i} - Finished generating card whose id is ##{id}."
  end
end

generateCards()
