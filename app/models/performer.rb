class Performer < ActiveRecord::Base
   attr_accessible :first_name,:last_name, :money_ytd, :name, :picture_url, :street_name, :longitude, :latitude
   has_many :Performance

   geocoded_by :address
   after_validation :geocode, :if => :address_changed?

end
