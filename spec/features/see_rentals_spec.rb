feature "rentals list" do

  scenario "should see a list of rentals" do
    visit '/'
    expect(page).to have_content "Makers BnB"
    click_on 'See Rentals'
    expect(page).to have_content "Place 1"
    expect(page).to have_content "Place 2"
  end

end
