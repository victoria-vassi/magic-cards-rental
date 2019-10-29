require 'json'
require 'open-uri'
require 'faker'

Card.destroy_all
for i in (1..10) do
  id = rand(1..4880)
  url = "https://api.magicthegathering.io/v1/cards/#{id}"
  cards_serialized = open(url).read
  cards = JSON.parse(cards_serialized)

  cards.each do |element|

    new_user_seller = User.new(
      email:    Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6),
      first_name:  Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    )
    new_user_seller.save!

    new_card = Card.create!(
      name: element[1]["name"],
      color: element[1]["colors"][0],
      card_type: element[1]["type"],
      cmc: element[1]["cmc"].to_s,
      power: element[1]["power"] ,
      toughness: element[1]["toughness"],
      img_url: element[1]["imageUrl"],
      price_per_week: rand(5..200),
      user: new_user_seller
    )
    puts new_card
  end
  puts " #{i} - Finished generating card whose id is ##{id} and associated user (seller)."
end

 5.times do
    new_user_buyer = User.new(
      email:    Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6),
      first_name:  Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    )
    new_user_buyer.save!
    puts new_user_buyer
end
    puts "Finished generating 5 users (buyer)"
