class SalaryInsightsService
  def self.by_country
    Employee.group(:country).pluck(:country, *salary_stats_sql).map do | country, min, max, avg |
      {
        country: country,
        min_salary: min.to_i,
        max_salary: max.to_i,
        average_salary: avg.to_f
      }
    end
  end

  def self.avg_salary_by_job_title(country)
    Employee.where(country: country).group(:job_title).average(:salary).transform_values(&:to_f)
  end

  private

  def self.salary_stats_sql
    [
      Arel.sql("MIN(salary)"),
      Arel.sql("MAX(salary)"),
      Arel.sql("AVG(salary)")
    ]
  end
end
