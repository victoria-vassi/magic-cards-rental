require 'json'
require 'open-uri'

class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def index
    @cards = policy_scope(Card)
  end

  def show
    @card = Card.find(params[:id])
    @bookings = Booking.where("card_id = #{params[:id]}")
    @booking = Booking.new
    @reviews = @card.reviews
    score = 0
      @reviews.each{|review| score += review.stars }
      if @reviews.count == 0
        @overall_rating =0
      else
       @overall_rating = sprintf('%.2f', (score / @reviews.count)) #round two decimals points
      end

  end

  def new
    @card_list = get_card_info
    @name_list = @card_list.each.map {|element| element[:name]}
    @card = Card.new
    authorize @card
    @review = @card.reviews.new #creates new review
    authorize @review
  end

  def create
    card_list = get_card_info
    right_card = card_list.find {|element| element[:name] == params[:card][:name]}
    @card = Card.new(right_card)
    @card[:price_per_week] = params[:card][:price_per_week]
    @card.user = current_user
    authorize @card
    if @card.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
    authorize @card
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    authorize @card
  end

  def destroy
    @card = Card.find(params[:id])
    authorize @card
    @card.destroy
    redirect_to user_profile_path(current_user)
  end

  private

    def get_card_info
      temp_array = [{:name=>"Ankh of Mishra", :color=>nil, :card_type=>"Artifact", :cmc=>"2.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1&type=card"}, {:name=>"Basalt Monolith", :color=>nil, :card_type=>"Artifact", :cmc=>"3.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2&type=card"}, {:name=>"Black Lotus",
      :color=>nil, :card_type=>"Artifact", :cmc=>"0.0", :power=>nil, :toughness=>nil,
      :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3&type=card"}, {:name=>"Black Vise", :color=>nil, :card_type=>"Artifact", :cmc=>"1.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4&type=card"}, {:name=>"Celestial Prism", :color=>nil, :card_type=>"Artifact",
      :cmc=>"3.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=5&type=card"}, {:name=>"Chaos Orb", :color=>nil, :card_type=>"Artifact", :cmc=>"2.0", :power=>nil, :toughness=>nil,
      :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=6&type=card"}, {:name=>"Clockwork Beast", :color=>nil, :card_type=>"Artifact Creature — Beast", :cmc=>"6.0", :power=>"0", :toughness=>"4", :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=7&type=card"}, {:name=>"Conservator",
      :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=8&type=card"}, {:name=>"Copper Tablet", :color=>nil, :card_type=>"Artifact", :cmc=>"2.0",
      :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=9&type=card"}, {:name=>"Crystal Rod", :color=>nil, :card_type=>"Artifact", :cmc=>"1.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=10&type=card"}, {:name=>"Cyclopean Tomb",
      :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=11&type=card"}, {:name=>"Dingus Egg", :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=12&type=card"}, {:name=>"Disrupting Scepter",
      :color=>nil, :card_type=>"Artifact", :cmc=>"3.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=13&type=card"}, {:name=>"Forcefield", :color=>nil, :card_type=>"Artifact", :cmc=>"3.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=14&type=card"}, {:name=>"Gauntlet of Might", :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil, :toughness=>nil,
      :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=15&type=card"}, {:name=>"Glasses of Urza", :color=>nil, :card_type=>"Artifact",
      :cmc=>"1.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=16&type=card"}, {:name=>"Helm of Chatzuk", :color=>nil, :card_type=>"Artifact", :cmc=>"1.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=17&type=card"}, {:name=>"Howling Mine", :color=>nil, :card_type=>"Artifact", :cmc=>"2.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=18&type=card"},
      {:name=>"Icy Manipulator", :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil,
      :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=19&type=card"},
      {:name=>"Illusionary Mask", :color=>nil, :card_type=>"Artifact", :cmc=>"2.0", :power=>nil,
      :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=20&type=card"}, {:name=>"Iron Star",
      :color=>nil, :card_type=>"Artifact", :cmc=>"1.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21&type=card"}, {:name=>"Ivory Cup", :color=>nil, :card_type=>"Artifact", :cmc=>"1.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22&type=card"}, {:name=>"Jade Monolith", :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=23&type=card"}, {:name=>"Jade Statue", :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=24&type=card"}, {:name=>"Jayemdae Tome", :color=>nil, :card_type=>"Artifact", :cmc=>"4.0", :power=>nil, :toughness=>nil, :img_url=>"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=25&type=card"}]
    end

  def set_card
    @card = Card.find(params[:id])
    authorize @card
  end

  def card_params
    params.require(:card).permit(:name, :color, :card_type, :cmc, :power, :toughness, :img_url, :price_per_week)
  end
end
