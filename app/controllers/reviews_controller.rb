class ReviewsController < ApplicationController
 before_action :set_card

    def index
      @reviews = policy_scope(@card.reviews)
      score = 0
      @reviews.each{|review| score += review.stars }
      if @reviews.count == 0
        @overall_rating =0
      else
       @overall_rating = sprintf('%.2f', (score / @reviews.count)) #round two decimals points
      end
    end

    def new
      @review = @card.reviews.new #creates new review
      authorize @review
    end

    def create

      @review = @card.reviews.new(review_params)
      @review.name = (current_user.first_name + " " + current_user.last_name) #only takes the username from current user
      authorize @review
      if @review.save

        redirect_to card_reviews_path(@card)
      else
        render :new
      end
    end

    private

    def review_params
      params.require(:review).permit(:comment, :stars)
    end

    def set_card
      @card = Card.find(params[:card_id])
    end
end
