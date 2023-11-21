class V1::EmployeesController < ApplicationController
  def index
    employees = Employee.page(default_page).per(default_per_page)
    render json: EmployeeSerializer.new(employees).serializable_hash
  end

  def show
    employee = Employee.find(params[:id])
    render json: EmployeeSerializer.new(employee).serializable_hash
  end
end
