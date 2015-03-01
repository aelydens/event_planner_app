require 'rails_helper'

feature 'Company Events' do
  scenario 'User can see all of a company\'s events at companies/1/events' do
    company = create_company(name: "Happy Corp")
    # company = Company.create(name: "Bogus Corp", size: 500)
    event_1 = Event.create(name: "Big Party", capacity: 6, company_id: company.id)
    event_2 = Event.create(name: "Little Party", capacity: 6, company_id: company.id)

    visit company_events_path(company)
    save_and_open_page
    expect(page).to have_content("Big Party")
    expect(page).to have_content("Little Party")
    expect(page).to have_content("Happy Corp")
  end
end
