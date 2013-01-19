class AddProviderToPerformer < ActiveRecord::Migration
  def up
		add_column :performers, :provider, :string
	end

	def down
		remove_column :performers, :provider, :string
	end
end
