class Card < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :card_type, presence: true
  validates :img_url, presence: true
  validates :price_per_week, presence: true, numericality: {greater_than_or_equal_t: 1}

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def available?(start_date, end_date)
    bool = true
    bookings.each do |booking|
      if booking.start_date > end_date || booking.end_date < start_date
      else
        bool = false
      end
    end
    bool
  end
end
