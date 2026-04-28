require 'rails_helper'

RSpec.describe SalaryInsightsService do
  describe ".by_country" do
    it "returns min, max and avarage salary per country" do
      Employee.create!( first_name: "John", last_name: "Doe", job_title: "Developer", salary: 50000, country: "India")
      Employee.create!( first_name: "Jane", last_name: "Smith", job_title: "Developer", salary: 70000, country: "India")
      Employee.create!( first_name: "Alice", last_name: "Johnson", job_title: "Developer", salary: 60000, country: "USA")

      result =  described_class.by_country

      india_data = result.find { |data| data[:country] == "India" }
      expect(india_data[:min_salary]).to eq(50000)
      expect(india_data[:max_salary]).to eq(70000)
      expect(india_data[:average_salary]).to eq(60000.0)
    end
  end

  describe ".avg_salary_by_job_title" do
    it "returns average salary per job title" do
      Employee.create!( first_name: "John", last_name: "Doe", job_title: "Engineer", salary: 50000, country: "India")
      Employee.create!( first_name: "Jane", last_name: "Smith", job_title: "Developer", salary: 70000, country: "India")
      Employee.create!( first_name: "Alice", last_name: "Johnson", job_title: "Developer", salary: 60000, country: "USA")

      result = described_class.avg_salary_by_job_title

      engineer_data = result.find { |data| data[:job_title] == "Engineer" }
      expect(engineer_data[:average_salary]).to eq(50000)

      developer_data = result.find { |data| data[:job_title] == "Developer" }
      expect(developer_data[:average_salary]).to eq(65000.0)
    end
  end
end
