class AddAddressToPerformer < ActiveRecord::Migration
  def change
    add_column :performers, :address, :string
  end
end
