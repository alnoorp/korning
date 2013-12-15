class SaleInvoice < ActiveRecord::Base
  belongs_to :sale
  belongs_to :invoice
end
