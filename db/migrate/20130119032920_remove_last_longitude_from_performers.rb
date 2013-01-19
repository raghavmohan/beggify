class RemoveLastLongitudeFromPerformers < ActiveRecord::Migration
  def up
    remove_column :performers, :last_longitude
  end

  def down
    add_column :performers, :last_longitude, :double
  end
end
