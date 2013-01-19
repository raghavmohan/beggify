class Performance < ActiveRecord::Base
  attr_accessible :name, :performed_at, :latitude, :longitude

  belongs_to :performer

  has_many :payments

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
