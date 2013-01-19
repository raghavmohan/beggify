class Performer < ActiveRecord::Base
  attr_accessible :venmo_id, :first_name,:last_name, :money_ytd, :name, :picture_url, :street_name, :longitude, :latitude, :name

  has_many :performances

  #before_save :check_lat_long


  private
  def check_lat_long
      if @performer.latitude.nil?
        @performer.latitude = 0.0
      end
      if @performer.longitude.nil?
        @performer.longitude = 0.0
      end
  end  

  #validates :street_name, :presence => true
  #validates :latitude, :presence => true
  #validates :longitude, :presence => true


  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

	def self.from_omniauth(auth)
  		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |performer|
    		performer.uid = performer.uid
    		performer.name = auth.info.name
    		performer.oauth_token = auth.credentials.token
    		performer.oauth_expires_at = Time.at(auth.credentials.expires_at)
    		performer.save!
  		end
	end
end
