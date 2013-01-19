class Performer < ActiveRecord::Base
   attr_accessible :venmo_id, :first_name,:last_name, :money_ytd, :name, :picture_url, :street_name, :longitude, :latitude, :name
   has_many :Performance

<<<<<<< HEAD
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

=======

	def self.from_omniauth(auth)
  		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |performer|
    		#user.provider = auth.provider
    		performer.uid = performer.uid
    		performer.name = auth.info.name
    		performer.oauth_token = auth.credentials.token
    		performer.oauth_expires_at = Time.at(auth.credentials.expires_at)
    		performer.save!
  		end
	end
>>>>>>> 22e95abda3fbee61ea18b51e84ed5408384b6b4d
end
