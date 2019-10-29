class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @card = Card.find(params[:card_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @card = card.find(params[:card_id])
    @booking.card = @card
    if @booking.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
