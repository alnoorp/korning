class CreateInvoices < ActiveRecord::Migration
  def up
    create_table :invoices do |t|
      t.string :number

      t.timestamps
    end
  end
  def down
    drop_table :invoices
  end
end
