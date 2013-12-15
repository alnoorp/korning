class AddAmountToInvoices < ActiveRecord::Migration
  def up
    add_column :invoices, :amount, :float
  end
  def down
    remove_column :invoices, :amount
  end
end
