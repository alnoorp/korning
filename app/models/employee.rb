class Employee < ActiveRecord::Base
  has_many :transactions

  def transactions_by_amount
    transactions.order("amount DESC")
  end

  def transactions_by_month
    transactions.order("date").group("id, extract(Month from date)").sum('amount')
  end

  def transactions_by_month_old
    transactions.group('extract(Month from date)').sum('amount')
  end

end
