class Performer < ActiveRecord::Base
  attr_accessible :first_name, :last_latitude, :last_longitude, :last_name, :money_ytd, :name, :picture_url, :street_name
   has_many :Performance
end
