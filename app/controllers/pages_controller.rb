class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    cards_all = Card.all
    @cards = cards_all.sample(4)
  end

  def user_profile
    @user = User.find(params[:id])
  end
end
