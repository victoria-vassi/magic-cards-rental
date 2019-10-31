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
 end

 def create
    @booking = Booking.new(booking_params)
    #authorize @booking
    @card = Card.find(params[:card_id])
    authorize @card
    @user = current_user
    @range = params["booking"]["start_date"]
    @start_date = @range.split(" ")[0].to_date
    @end_date = @range.split(" ")[-1].to_date
    @nbdays = (@end_date-@start_date).to_i
    @total_price = @card.price_per_week/7*@nbdays
    @booking.end_date = @end_date
    @booking.card = @card
    @booking.user = @user
    @booking.total_price = @total_price
   if @booking.save
     redirect_to card_path(@card)
   else
      @bookings = Booking.where("card_id = '#{params[:card_id]}'")
      raise
      render 'cards/show'
   end
 end

 private
 def set_booking
   @booking = Booking.find(params[:id])
 end

 def booking_params
   params.require(:booking).permit(:start_date, :end_date, :total_price, :card_id)
 end


end
