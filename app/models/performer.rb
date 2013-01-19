class Performer < ActiveRecord::Base
<<<<<<< HEAD
   attr_accessible :first_name,:last_name, :money_ytd, :name, :picture_url, :street_name, :longitude, :latitude
=======
  attr_accessible :venmo_id, :first_name, :last_latitude, :last_longitude, :last_name, :money_ytd, :name, :picture_url, :street_name
>>>>>>> 09986c82cb0e17d77aaff5cb2392703619d702ee
   has_many :Performance

   geocoded_by :address
   after_validation :geocode, :if => :address_changed?

end
