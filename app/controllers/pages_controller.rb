class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    cards_all = Card.all
    @cards = cards_all.sample(8)
  end
end
