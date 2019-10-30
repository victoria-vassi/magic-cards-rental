class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def index
    @cards = policy_scope(Card)
  end

  def show
    @card = Card.find(params[:id])
    @bookings = Booking.where("card_id = #{params[:id]}")
  end

  def new
    authorize @card
    @card = current_user.card.new
  end

  def create
    authorize @card
    @card = Card.new(card_params)
    @card.user = current_user
    if @card.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  def edit
    authorize @card
    @card = Card.find(params[:id])
  end

  def update
    authorize @card
    @card = Card.find(params[:id])
    @card.update(card_params)
  end

  def destroy
    authorize @card
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to card_path
  end

  private

  def set_card
    @card = Card.find(params[:id])
    authorize @card
  end

  def card_params
    params.require(:card).permit(:name, :color, :card_type, :cmc, :power, :toughness, :img_url, :price_per_week)
  end
end
