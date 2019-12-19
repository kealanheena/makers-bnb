feature "Requests page" do

  before do
    sign_up_test
    add_rental_feature
    click_button "Log Out"
    sign_up_bob

    click_on "Place 1"
    fill_in "date", with: '2019-05-04'
    click_on "Check Date"
    click_on "Book"

    visit '/'
    click_on "Place 2"
    fill_in "date", with: '2019-05-04'
    click_on "Check Date"
    click_on "Book"
  end


  scenario "shows a list of all bookings made by logged-in user" do
    visit '/'
    click_on "Requests"

    expect(page).to have_content "Name: Place 1"
    expect(page).to have_content "Description: Really really really nice place"
    expect(page).to have_content "Total Price: £20"
    expect(page).to have_content "Date:"
    expect(page).to have_content "Owner: JDTest"
    expect(page).to have_content "Booking Status: Pending"

    expect(page).to have_content "Name: Place 2"
    expect(page).to have_content "Description: Picturesque location on a lak"
    expect(page).to have_content "Total Price: £30"
    expect(page).to have_content "Date:"
    expect(page).to have_content "Owner: JDTest"
    expect(page).to have_content "Booking Status: Pending"
  end

  scenario "shows a list of all requests made for the logged-in user's rentals" do
    click_button "Log Out"
    log_in_test

    click_on "Requests"

    expect(page).to have_content "Name: Place 1"
    expect(page).to have_content "Description: Really really really nice place"
    expect(page).to have_content "Total Price: £20"
    expect(page).to have_content "Date:"
    expect(page).to have_content "Requested by: helloBob"
    expect(page).to have_content "Booking Status: Pending"

    expect(page).to have_content "Name: Place 2"
    expect(page).to have_content "Description: Picturesque location on a lak"
    expect(page).to have_content "Total Price: £30"
    expect(page).to have_content "Date:"
    expect(page).to have_content "Requested by: helloBob"
    expect(page).to have_content "Booking Status: Pending"
  end
end
