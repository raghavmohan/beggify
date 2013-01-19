class Performer < ActiveRecord::Base
  attr_accessible :name, :venmo_id, :money_ytd, :name, :picture_url, :street_name, :name, :provider, :uid, :current_performance

  has_many :performances

  #validates :street_name, :presence => true
  #validates :latitude, :presence => true
  #validates :longitude, :presence => true

	def self.from_omniauth(auth)
  		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |performer|
    		performer.provider = auth["provider"]
    		performer.uid = auth["uid"]
    		performer.name = auth["info"]["name"]
    		performer.oauth_token = auth.credentials.token
    		performer.oauth_expires_at = Time.at(auth.credentials.expires_at)
    		performer.save!
  		end
	end
end
