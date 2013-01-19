class RenameLatAndLongPerformances < ActiveRecord::Migration
  def up
  	rename_column :performances, :performed_latitude, :latitude
		rename_column :performances, :performed_longitude, :longitude
	end

  def down
	 	rename_column :performances, :latitude, :performed_latitude
		rename_column :performances, :longitude, :performed_longitude
  end
end
