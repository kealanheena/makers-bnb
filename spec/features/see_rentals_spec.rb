feature "rentals list" do

  scenario "should see a list of rentals" do
    visit '/'
    expect(page).to have_content "Makers BnB"
  end

  scenario "should see a list of rentals" do
    visit "/rentals"
    
    expect(page).to have_content "Place 1"
    expect(page).to have_content "Place 2"
  end

end
