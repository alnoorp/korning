class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
  end

end
