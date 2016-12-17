class CityPricing < ActiveRecord::Base
  belongs_to :city
  has_many :venues

  validates :city, presence: true
end
