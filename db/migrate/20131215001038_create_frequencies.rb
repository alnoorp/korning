class CreateFrequencies < ActiveRecord::Migration
  def up
    create_table :frequencies do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
  def down
    drop_table :frequencies
  end
end
