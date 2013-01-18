class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.decimal :last_latitude
      t.string :last_longitude
      t.decimal :money_ytd
      t.string :street_name
      t.string :picture_url

      t.timestamps
    end
  end
end
