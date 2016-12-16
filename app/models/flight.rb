class Flight < ActiveRecord::Base
  belongs_to :origin_city, class_name: 'City'
  belongs_to :destination_city, class_name: 'City'
  belongs_to :avarage_flight_pricing

  validates :origin_city, :destination_city, :flight_date, :quote_datetime, :min_price, presence: true

  after_save :recalculate_avarage_flight_pricing

  private
    def recalculate_avarage_flight_pricing
      self.avarage_flight_pricing.price = self.avarage_flight_pricing.flights.sum(:min_price) / self.avarage_flight_pricing.flights.count
      self.avarage_flight_pricing.save
    end
end
