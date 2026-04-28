require 'rails_helper'

RSpec.describe "Employees", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "creates new employee" do
    visit employees_path

    click_link "New Employee"

    fill_in "First name",	with: "John"
    fill_in "Last name",	with: "Doe"
    fill_in "Job title",	with: "Engineer"
    fill_in "Country",	with: "India"
    fill_in "Salary",	with: 50000

    click_button "Create Employee"

    expect(page).to have_text("Employee was successfully created")
    expect(page).to have_text("John Doe")
  end
end
