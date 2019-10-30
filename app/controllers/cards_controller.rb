require 'json'
require 'open-uri'

class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    @bookings = Booking.where("card_id = #{params[:id]}")
    @booking = Booking.new

  end

  def new
    get_card_info
    @card = Card.new

  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    if @card.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  private
    def get_card_info

      for i in (1..50) do
        id = rand(1..4880)
        url = "https://api.magicthegathering.io/v1/cards/#{id}"
        card_serialized = open(url).read
        card = JSON.parse(card_serialized)
      end

    end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :color, :card_type, :cmc, :power, :toughness, :img_url, :price_per_week)
  end
end
