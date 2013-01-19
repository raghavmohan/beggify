class Performance < ActiveRecord::Base
  attr_accessible :name, :performed_at, :performed_latitude, :performed_longitude

  belongs_to :performer

  has_many :payments
end
