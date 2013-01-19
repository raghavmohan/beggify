class RemoveFirstNameFromPerformers < ActiveRecord::Migration
  def up
    remove_column :performers, :first_name
  end

  def down
    add_column :performers, :first_name, :string
  end
end
