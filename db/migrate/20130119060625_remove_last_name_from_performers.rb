class RemoveLastNameFromPerformers < ActiveRecord::Migration
  def up
    remove_column :performers, :last_name
  end

  def down
    add_column :performers, :last_name, :string
  end
end
