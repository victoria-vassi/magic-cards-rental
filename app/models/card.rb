class Card < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :card_type, presence: true
  validates :img_url, presence: true
  validates :price_per_week, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
