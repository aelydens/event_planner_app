require 'rails_helper'

feature 'Company Events' do
  scenario 'User can see all of a company\'s events at companies/1/events' do
    company = Company.create(name: "Bogus Corp", size: 500)
    event_1 = Event.new(name: "Retirement Party", capacity: 6)
    event_2 = Event.new(name: "Promotion Party", capacity: 6)
    company.events << [event_1, event_2]

    visit company_events_path(company)
    expect(page).to have_content("Retirement Party")
    expect(page).to have_content("Promotion Party")
    expect(page).to have_content("Bogus Corp")
  end
end
