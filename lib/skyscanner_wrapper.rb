class SkyscannerWrapper
  MARKET = 'TR'
  CURRENCY = 'TRY'
  LOCALE = 'tr-TR'
  ORIGIN_PLACE = "ISTA"
  API_URL = 'http://partners.api.skyscanner.net/apiservices/browsegrid/v1.0/'
  API_KEY = ENV['SKYSCANNER_API_KEY'] || 'bo859179245265755287837313776552'

  # E.g. input: ["LOND", "BERL"]
  def self.fetch_cities_avarage_pricing(city_initials)
    city_initials.each do |city_initial|
      city = City.find_by(initials: city_initial)

      get_flights_for(city)
    end
  end

  def self.get_flights_for(city)
    destinationPlace = city.initials
    outboundPartialDate = Time.zone.now.advance(days: 1).strftime("%Y-%m")

    url = API_URL + "#{MARKET}/#{CURRENCY}/#{LOCALE}/#{ORIGIN_PLACE}/#{destinationPlace}/#{outboundPartialDate}?apiKey=#{API_KEY}"

    data = HTTParty.get(url)

    avarage_flight_pricing = create_avarage_flight_pricing_for(city)
    save_flights_for_city(data, avarage_flight_pricing)
  end

  def self.save_flights_for_city(data, avarage_flight_pricing)
    pricing_and_quote_values = data["Dates"][1]

    pricing_and_quote_values.each_with_index do |pricing_and_quote_value, index|
      next unless pricing_and_quote_value.present?

      Flight.create(origin_city: origin_city,
                    destination_city: avarage_flight_pricing.destination_city,
                    avarage_flight_pricing: avarage_flight_pricing,
                    flight_date: Date.new(Time.zone.now.year, Time.zone.now.month, index),
                    quote_datetime: pricing_and_quote_value['QuoteDateTime'],
                    min_price: pricing_and_quote_value['MinPrice'].to_i)

    end
  end

  def self.origin_city
    @origin_city ||= City.find_by(name: 'Istanbul')
  end

  def self.create_avarage_flight_pricing_for(destination_city)
    AvarageFlightPricing.create(origin_city: origin_city,
                                destination_city: destination_city)
  end
end
