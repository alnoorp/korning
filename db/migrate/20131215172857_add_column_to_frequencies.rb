class AddColumnToFrequencies < ActiveRecord::Migration
  def up
    add_column :frequencies, :period, :integer
  end
  def down
    remove_column :frequencies, :period
  end
end
