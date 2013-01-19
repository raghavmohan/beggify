class Performer < ActiveRecord::Base
  attr_accessible :venmo_id, :first_name, :last_latitude, :last_longitude, :last_name, :money_ytd, :name, :picture_url, :street_name
  has_many :Performance

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end