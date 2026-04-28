require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "validations" do
    it 'is invalid without a first name' do
      employee = Employee.new(first_name: nil)
      expect(employee).not_to be_valid
    end

    it 'is invalid without a last name' do
      employee = Employee.new(last_name: nil)
      expect(employee).not_to be_valid
    end

    it 'is invalid without a job title' do
      employee = Employee.new(job_title: nil)
      expect(employee).not_to be_valid
    end

    it 'is invalid without a salary' do
      employee = Employee.new(salary: nil)
      expect(employee).not_to be_valid
    end

    it 'is invalid without a country' do
      employee = Employee.new(country: nil)
      expect(employee).not_to be_valid
    end
  end

  describe "#full_name" do
    it 'returns the full name of the employee' do
      employee = Employee.new(first_name: "John", last_name: "Doe")
      expect(employee.full_name).to eq("John Doe")
    end
  end
end
