class RemoveLastLatitudeFromPerformers < ActiveRecord::Migration
  def up
    remove_column :performers, :last_latitude
  end

  def down
    add_column :performers, :last_latitude, :double
  end
end
