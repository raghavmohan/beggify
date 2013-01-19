class AddCurrentPerformanceToPerfromer < ActiveRecord::Migration
  def up
		add_column :performers, :current_performance, :int
		remove_column :performers, :latitude, :float
		remove_column :performers, :longitude, :float
  end

	def down
		remove_column :performers, :current_performance, :int
		add_column :performers, :latitude, :float
		add_column :performers, :longitude, :float
	end
  
end
