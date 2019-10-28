class Card < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :color, presence: true
  validates :type, presence: true
  validates :img_url, presence: true
  validates :price_per_week, presence: true
end
