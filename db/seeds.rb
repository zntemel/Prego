# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.find_or_create_by(name: 'Istanbul', initials: 'ISTA')
City.find_or_create_by(name: 'Paris', initials: 'PARI', pricing: 212)
City.find_or_create_by(name: 'Barcelona', initials: 'BCN', pricing: 147)
City.find_or_create_by(name: 'Berlin', initials: 'BERL', pricing: 159)
City.find_or_create_by(name: 'London', initials: 'LOND', pricing: 254)
City.find_or_create_by(name: 'Prague', initials: 'PRG', pricing: 100)
City.find_or_create_by(name: 'Amsterdam', initials: 'AMS', pricing: 198)
City.find_or_create_by(name: 'Madrid', initials: 'MAD', pricing: 147)
City.find_or_create_by(name: 'Zurich', initials: 'ZRH', pricing: 298)
City.find_or_create_by(name: 'Venice', initials: 'VENI', pricing: 161)
City.find_or_create_by(name: 'Rome', initials: 'ROME', pricing: 164)
City.find_or_create_by(name: 'Budapest', initials: 'BUD', pricing: 101)
City.find_or_create_by(name: 'Vienna', initials: 'VIE', pricing: 157)
City.find_or_create_by(name: 'Belgrade', initials: 'OST', pricing: 91)
City.find_or_create_by(name: 'Milan', initials: 'MILA', pricing: 166)
City.find_or_create_by(name: 'Lisbon', initials: 'LIS', pricing: 134)
City.find_or_create_by(name: 'Dublin', initials: 'DUB', pricing: 220)
City.find_or_create_by(name: 'Manchester', initials: 'MAN', pricing: 168)
City.find_or_create_by(name: 'Florence', initials: 'FLR', pricing: 153)
City.find_or_create_by(name: 'Copenhagen', initials: 'CPH', pricing: 231)
City.find_or_create_by(name: 'Helsinki', initials: 'HEL', pricing: 191)
