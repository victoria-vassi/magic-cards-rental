class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    cards_all = Card.all
    @cards = cards_all.sample(4)
  end

  def user_profile
    @user = User.find(params[:id])
    @cards = Card.where(user: @user)

    @bookings_made = Booking.where(user: @user)
    @bookings_made_upcoming = @bookings_made.where("start_date >= ?", "#{Date.today}").sort
    @bookings_made_past = @bookings_made.where("start_date < ?", "#{Date.today}").sort

    @bookings_received = Booking.includes(:card).where(cards: { user_id: @user.id})

    @bookings_received_upcoming = @bookings_received.where("start_date <= ?", "#{Date.today}").sort
    @bookings_received_past = @bookings_received.where("start_date > ?", "#{Date.today}").sort
  end
end
