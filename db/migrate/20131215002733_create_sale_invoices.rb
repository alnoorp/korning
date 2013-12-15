class CreateSaleInvoices < ActiveRecord::Migration
  def up
    create_table :sale_invoices do |t|
      t.string :sale_id
      t.string :invoice_id

      t.timestamps
    end
  end
  def down
    drop_table :sale_invoices
  end
end
