class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employees = Employee.find(params[:id])
  end

end
