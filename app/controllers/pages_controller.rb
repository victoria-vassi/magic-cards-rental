class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    cards = Card.all
    @cards_selection = cards.sample(8)
  end
end
