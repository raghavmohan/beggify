class AddAddressToPerformance < ActiveRecord::Migration
  def up
		add_column :performances, :address, :string
  	remove_column :performers, :address, :string
	end
	def down
		remove_column :performances, :address, :string
  	add_column :performers, :address, :string
	end
end
