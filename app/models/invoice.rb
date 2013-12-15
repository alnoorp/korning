class Invoice < ActiveRecord::Base
  has_many :transactions
  has_many :transactions, through: :sale_invoices
end
