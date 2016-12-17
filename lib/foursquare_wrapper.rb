class FoursquareWrapper
  API_KEY = ENV['FOURSQUARE_API_KEY'] || 'TE3X5D04FGYUTPQXHC40ZS1DYMO54TCXANJ04NK200HRERID'
  API_URL = "https://api.foursquare.com/v2/venues/explore"
  

  def self.fetch_cities_avarage_pricing(city_ids)
    city_ids.each do |city_id|
      city = City.find(city_id)

      get_venues_for(city)
    end
  end

  def self.get_venues_for(city)
    url = API_URL + "?limit=50&near=#{city.name}&oauth_token=#{API_KEY}&v=20161217"

    data = HTTParty.get(url)

    city_rating = create_avarage_rating_for(city)
    city_visit_frequency = create_avarage_visit_frequency_for(city)
    save_venue_pricing_for_city(data, city_rating, city_visit_frequency)
  end

  def self.save_venue_pricing_for_city(data, city_rating, city_visit_frequency)
    data['response']['groups'].each do |group|
      if group.present? && group['items'].present?
        group['items'].each do |item|
          if item.present? && item['venue'].present?
            venue = Venue.new
            venue.city_rating = city_rating
            venue.city_visit_frequency = city_visit_frequency

            if item['venue']['rating'].present?
              venue.rating = item['venue']['rating']
              venue.save
            end

            if item['venue']['stats'].present? && item['venue']['stats']['checkinsCount'].present?
              venue.visit_frequency = item['venue']['stats']['checkinsCount']
              venue.save
            end
          end
        end
      end
    end
  end

  def self.origin_city
    @origin_city ||= City.find_by(name: 'Istanbul')
  end

  def self.create_avarage_rating_for(city)
    CityRating.create(city: city)
  end

  def self.create_avarage_visit_frequency_for(city)
    CityVisitFrequency.create(city: city)
  end
end
