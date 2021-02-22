class Ride < ApplicationRecord
  belongs_to :park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides
    where(open: true)
  end

  def self.order_by_rating
    order("thrill_rating DESC")
  end

  def self.average_thrill_rating
    average(:thrill_rating)
  end

  def self.alph_order
    order("name")
  end
end
