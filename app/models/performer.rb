class Performer < ActiveRecord::Base
  attr_accessible :first_name, :last_latitude, :last_longitude, :last_name, :money_ytd, :name, :picture_url, :street_name
   has_many :Performance


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
end
