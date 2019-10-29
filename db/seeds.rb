require 'json'
require 'open-uri'
require 'faker'

# Generating a card, with its associated user(buyer) and booking with its associated user(buyer) and card(whose user_id belongs to the seller). Generating x instances.
puts "Seeding 16 users, 8 cards and 8 bookings..."

for i in (1..8) do
    id = rand(1..4880)
    url = "https://api.magicthegathering.io/v1/cards/#{id}"
    cards_serialized = open(url).read
    cards = JSON.parse(cards_serialized)

    cards.each do |element|

      new_user_buyer = User.create!(
        email:    Faker::Internet.email,
        password: Faker::Internet.password(min_length: 6),
        first_name:  Faker::Name.first_name,
        last_name: Faker::Name.last_name,
      )
      new_user_seller = User.create!(
        email:    Faker::Internet.email,
        password: Faker::Internet.password(min_length: 6),
        first_name:  Faker::Name.first_name,
        last_name: Faker::Name.last_name,
      )
      new_card = Card.create!(
        name: element[1]["name"],
        color: element[1]["colors"][0],
        card_type: element[1]["type"],
        cmc: element[1]["cmc"].to_s,
        power: element[1]["power"] ,
        toughness: element[1]["toughness"],
        img_url: element[1]["imageUrl"],
        price_per_week: p = rand(5..200),
        user: new_user_seller
      )
      new_booking = Booking.create!(
        start_date:    n = Faker::Date.forward(days: 120),
        end_date: n+14,
        total_price: p*2,
        user: new_user_buyer,
        card: new_card
      )
  end
puts " #{i} - Created 1 user(seller), 1 card, 1 user(buyer) and 1 booking "

end
puts " Finished generating 8 users(sellers) with their 8 associated cards AND 8 users(buyers) with their associated bookings"


#Generating a card with its associated user. Seeding it x times.
# puts "Seeding 8 users(seller) with their 8 associated cards"
# Card.destroy_all
# for i in (1..5) do
#   id = rand(1..4880) #there is 4880 cards in the API we scrape
#   url = "https://api.magicthegathering.io/v1/cards/#{id}"
#   cards_serialized = open(url).read
#   cards = JSON.parse(cards_serialized)

#   cards.each do |element|

#     new_user_seller = User.create!(
#       email:    Faker::Internet.email,
#       password: Faker::Internet.password(min_length: 6),
#       first_name:  Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#     )

#     new_user_buyer = User.create!(
#       email:    Faker::Internet.email,
#       password: Faker::Internet.password(min_length: 6),
#       first_name:  Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#     )

#     new_card = Card.create!(
#       name: element[1]["name"],
#       color: element[1]["colors"][0],
#       card_type: element[1]["type"],
#       cmc: element[1]["cmc"].to_s,
#       power: element[1]["power"] ,
#       toughness: element[1]["toughness"],
#       img_url: element[1]["imageUrl"],
#       price_per_week: rand(5..200),
#       user: new_user_seller
#     )
#   end
#   puts " #{i} - Finished generating a card (##{id} in the API )"
# end
