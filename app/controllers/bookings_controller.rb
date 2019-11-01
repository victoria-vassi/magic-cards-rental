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
    authorize @card
    authorize @booking
  end

  def create
    @booking = Booking.new
    @card = Card.find(params[:card_id])
    authorize @card
    @user = current_user
    @range = params["booking"]["start_date"]
    @start_date = @range.split(" ")[0].to_date
    @end_date = @range.split(" ")[-1].to_date
    @nbdays = (@end_date-@start_date).to_i
    @total_price = @card.price_per_week/7*@nbdays
    @booking.total_price = @total_price
    @booking.end_date = @end_date
    @booking.start_date = @start_date
    @booking.card = @card
    @booking.user = @user
    authorize @booking
    if @booking.save
      redirect_to card_path(@card)
    else
      @bookings = Booking.where("card_id = '#{params[:card_id]}'")
      render 'cards/show'
    end
  end

  def createmany
    user = current_user
    range = params["range"]
    start_date = range.split(" ")[0].to_date
    end_date = range.split(" ")[-1].to_date
    nbdays = (end_date-start_date).to_i

    card_ids_string = params["cards"]
    card_ids = card_ids_string.split(" ")
    card_ids.each do |id|
      booking = Booking.new
      card = Card.find(id)
      total_price = card.price_per_week/7*nbdays
      booking.total_price = total_price
      booking.end_date = end_date
      booking.start_date = start_date
      booking.card = card
      booking.user = user
      authorize booking
      booking.save
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :total_price, :card_id)
  end
end
