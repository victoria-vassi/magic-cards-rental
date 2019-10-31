class ReviewsController < ApplicationController
 before_action :set_card

    def index
      @reviews = policy_scope(Review)
    end

    def new
      @review = @card.reviews.new
      authorize @review
    end

    def create

      @review = @card.reviews.new(review_params)
      authorize @review
      if @review.save
        redirect_to card_reviews_path(@card)
      else
        render :new
      end
    end

    private

    def review_params
      params.require(:review).permit(:name, :comment, :stars)
    end

    def set_card
      @card = Card.find(params[:card_id])
    end
end
