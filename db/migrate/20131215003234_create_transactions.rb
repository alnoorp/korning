class CreateTransactions < ActiveRecord::Migration
  def up
    create_table :transactions do |t|
      t.date :date, null: false
      t.float :amount, null: false
      t.integer :quantity, null: false
      t.integer :product_id, null: false
      t.integer :customer_id, null: false
      t.integer :employee_id, null: false
      t.integer :invoice_id, null: false
      t.integer :frequency_id, null: false

      t.timestamps
    end
  end
  def down
    drop_table :transactions
  end
end
