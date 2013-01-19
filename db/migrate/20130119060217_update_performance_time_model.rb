class UpdatePerformanceTimeModel < ActiveRecord::Migration
  def up
    add_column :performances, :start_time, :datetime
    add_column :performances, :end_time, :datetime
    remove_column :performances, :performed_at
  end

  def down
    remove_column :performances, :start_time
    remove_column :performances, :end_time
    add_column :performances, :performed_at, :datetime
  end
end
