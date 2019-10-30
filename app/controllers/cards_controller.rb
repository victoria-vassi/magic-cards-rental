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
    @card = current_user.card.new
    authorize @card
  end

  def create
    @card = Card.new(card_params)
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
    @card.destroy
    authorize @card
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
