namespace :prego do
  desc 'Creates avarage city pricing, rating and visit frequency'
  task create_city_values: :environment do
    city_ids = City.where.not(name: 'Istanbul').collect(&:id)
    FoursquareWrapper.fetch_cities_avarage_pricing(city_ids)
  end
end
