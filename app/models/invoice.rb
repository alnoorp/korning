class Invoice < ActiveRecord::Base
  has_many :transactions
  has_many :transactions, through: :sale_invoices
  has_one :frequency, through: :transactions
end
