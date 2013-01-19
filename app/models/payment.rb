class Payment < ActiveRecord::Base
  attr_accessible :amount

  belongs_to :performance
end
