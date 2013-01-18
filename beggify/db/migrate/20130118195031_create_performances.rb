class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.string :name
      t.datetime :performed_at
      t.decimal :performed_latitude
      t.decimal :performed_longitude

      t.timestamps
    end
  end
end
