class Employee < ApplicationRecord
  validates :first_name, :last_name, :job_title, :salary, :country, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
