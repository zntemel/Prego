class Venue < ActiveRecord::Base
  belongs_to :city
  belongs_to :city_pricing
  belongs_to :city_rating
  belongs_to :city_visit_frequency

  # validates :pricing, presence: true

  after_save :recalculate_avarage_city_values

  private
    def recalculate_avarage_city_values
      self.city_pricing.value = self.city_pricing.venues.sum(:pricing) / self.city_pricing.venues.where.not(pricing: nil).count if pricing_changed?
      self.city_rating.value = self.city_rating.venues.sum(:rating) / self.city_rating.venues.where.not(rating: nil).count if rating_changed?
      self.city_visit_frequency.value = self.city_visit_frequency.venues.sum(:visit_frequency) / self.city_visit_frequency.venues.where.not(visit_frequency: nil).count if visit_frequency_changed?
      self.city_pricing.save
      self.city_rating.save
      self.city_visit_frequency.save
    end
end
