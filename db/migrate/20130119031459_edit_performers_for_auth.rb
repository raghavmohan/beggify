class EditPerformersForAuth < ActiveRecord::Migration
  	def up
  		add_column :performers, :uid, :string
		add_column :performers, :oauth_token, :string
		add_column :performers, :oauth_expires_at, :datetime
	end

  	def down
	 	remove_column :performers, :uid, :string
        remove_column :performers, :oauth_token, :string
        remove_column :performers, :oauth_expires_at, :datetime
  	end
end
