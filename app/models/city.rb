class City < ActiveRecord::Base
  validates :name, :initials, presence: true
end
