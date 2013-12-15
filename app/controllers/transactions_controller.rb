class TransactionsController < ApplicationController
  def index
    latest = Transaction.order("date DESC").first.date
    quarter = latest.months_ago(3)
    @transactions = Transaction.order("date DESC").where("date > ?", quarter)
  end

  def show
    @transactions = Transaction.find(params[:id])
  end

end
