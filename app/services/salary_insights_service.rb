class SalaryInsightsService
  def self.by_country
    Employee.group(:country).select(
      "country, MIN(salary) AS min_salary, MAX(salary) AS max_salary, AVG(salary) AS average_salary"
    ).map do |record|
      {
        country: record.country,
        min_salary: record.min_salary.to_i,
        max_salary: record.max_salary.to_i,
        average_salary: record.average_salary.to_f
      }
    end
  end

  def self.avg_salary_by_job_title
    Employee.group(:job_title).select(
      "job_title, AVG(salary) AS average_salary"
    ).map do |record|
      {
        job_title: record.job_title,
        average_salary: record.average_salary.to_f
      }
    end
  end
end
