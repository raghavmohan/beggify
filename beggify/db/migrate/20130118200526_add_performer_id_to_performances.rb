class AddPerformerIdToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :performer_id, :integer
  end
end
