require_relative '../web_helpers.rb'

feature 'book rental' do

  scenario 'it should show confirmation' do
    add_rentals
    visit '/'
    click_on 'Place 1'
    expect(page).to have_content 'Place 1'
    click_on 'Book'
    expect(page).to have_content 'Booking confirmed!'
  end

end
