feature "rentals list" do

  scenario "should see a list of rentals without being logged in" do
    sign_up_test
    add_rental_feature
    click_button "Log Out"

    visit '/'
    expect(page).to have_content "Makers BnB"
    expect(page).to have_content "Place 1"
  end

  scenario "should see a list of rentals if logged in" do
    sign_up_test
    add_rental_feature

    click_on 'Add Rental'
    fill_in 'name', with: 'Place 2'
    fill_in 'description', with: 'great place'
    fill_in 'price', with: '30'
    fill_in 'starting', with: '2020-01-01'
    fill_in 'ending', with: '2020-12-01'
    click_on 'Submit'

    expect(page).to have_content "Place 1"
    expect(page).to have_content "Place 2"
  end

end
