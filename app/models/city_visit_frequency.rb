class CityVisitFrequency < ActiveRecord::Base
  belongs_to :city

  has_many :venues
end
