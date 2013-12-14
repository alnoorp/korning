class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :name, null: false
      t.integer :account_number, null: false
      t.string :website

      t.timestamps
    end
  end
  def down
    drop_table :customers
  end
end
