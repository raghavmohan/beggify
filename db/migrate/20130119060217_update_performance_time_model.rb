class UpdatePerformanceTimeModel < ActiveRecord::Migration
  def up
    add_column :performance, :start_time, :datetime
    add_column :performance, :end_time, :datetime
    remove_column :performance, :performed_at
  end

  def down
    remove_column :performance, :start_time
    remove_column :performance, :end_time
    add_column :performance, :performed_at, :datetime
  end
end
