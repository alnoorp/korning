class Employee < ActiveRecord::Base
  has_many :transactions

  def transactions_by_amount
    transactions.order("amount DESC")
  end
end
