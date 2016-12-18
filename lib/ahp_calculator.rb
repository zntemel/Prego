class AhpCalculator
  def self.sort_decisions(city_ids)
    get_skyscanner_data_for(city_ids)
    cities = get_city_values(city_ids)

    cities = normalize(cities)
    eigen_vector = { flight_pricing: 0.39, city_rating: 0.18, city_pricing: 0.11, visit_frequency: 0.32 }
    cities = use_with_eigen_vector(cities, eigen_vector)
  end

  def self.get_city_values(city_ids)
    cities = { }

    city_ids.each do |city_id|
      city = City.find_by(id: city_id)
      cities[city.name] = {
        flight_pricing: (1 / city.avarage_flight_pricings.last.price.to_f).round(5),
        city_rating: city.city_ratings.last.value.to_f,
        city_pricing: (1 / city.pricing.to_f).round(5),
        visit_frequency: city.city_visit_frequencies.last.value.to_f
      }

      unless cities['sum'].present?
        cities['sum'] = {
          flight_pricing: (1 / city.avarage_flight_pricings.last.price.to_f).round(5),
          city_rating: city.city_ratings.last.value.to_f,
          city_pricing: (1 / city.pricing.to_f).round(5),
          visit_frequency: city.city_visit_frequencies.last.value.to_f
        }
      else
        cities['sum'][:flight_pricing] = cities['sum'][:flight_pricing] + (1 / city.avarage_flight_pricings.last.price.to_f).round(5)
        cities['sum'][:city_rating] = cities['sum'][:city_rating] + city.city_ratings.last.value.to_f
        cities['sum'][:city_pricing] = cities['sum'][:city_pricing] + (1 / city.pricing.to_f).round(5)
        cities['sum'][:visit_frequency] = cities['sum'][:visit_frequency] + city.city_visit_frequencies.last.value.to_f
      end
    end

    return cities
  end

  def self.normalize(cities)
    cities.each do |city_row|
      next if city_row.first == 'sum'
      city_row.second.each do |key, value|
        city_row.second[key] = value / cities['sum'][key]
      end
    end

    return cities
  end

  def self.use_with_eigen_vector(cities, eigen_vector)
    cities.each do |city_row|
      next if city_row.first == 'sum'
      city_row.second['sum'] = 0
      city_row.second.each do |key, value|
        next if key == 'sum'

        city_row.second[key] = value * eigen_vector[key]
        city_row.second['sum'] += value * eigen_vector[key]
      end
    end

    cities.delete('sum')
    cities = cities.sort_by {|key, value| value["sum"]}
    cities = cities.reverse

    return cities
  end

  def self.get_skyscanner_data_for(city_ids)
    SkyscannerWrapper.fetch_cities_avarage_pricing(city_ids)
  end
  
end
