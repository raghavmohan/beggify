class AddVenmoToPerformer < ActiveRecord::Migration
  def up
    add_column :performers, :venmo_id, :string
  end

  def down
    remove_column :performers, :venmo_id
  end
end
