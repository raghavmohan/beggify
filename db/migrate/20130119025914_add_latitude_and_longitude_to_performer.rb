class AddLatitudeAndLongitudeToPerformer < ActiveRecord::Migration
  def change
    add_column :performers, :latitude, :float
    add_column :performers, :longitude, :float
  end
end
