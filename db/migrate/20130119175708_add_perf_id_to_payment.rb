class AddPerfIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :performance_id, :integer
  end
end
