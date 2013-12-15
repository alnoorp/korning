require 'float'

class Transaction < ActiveRecord::Base
  has_many :invoices
  has_many :invoices, through: :sale_invoices
  has_many :products
  belongs_to :customer
  belongs_to :employee
  belongs_to :frequency

  def unit_price
    (amount / quantity).floor_to(2)
  end

  def quarter
    return if date = Date.new(2012, 11, 13)
  end
end
