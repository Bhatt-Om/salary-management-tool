class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @employee = Employee.new
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      @employees = Employee.all

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to employees_path, notice: "Employee was successfully created" }
      end
    else
      @employees = Employee.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :job_title, :country, :salary)
  end
end
