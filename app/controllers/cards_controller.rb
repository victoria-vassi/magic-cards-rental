class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    #@bookings = @card.bookings
  end

  def new
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

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :color, :card_type, :cmc, :power, :toughness, :img_url, :price_per_week)
  end
end
