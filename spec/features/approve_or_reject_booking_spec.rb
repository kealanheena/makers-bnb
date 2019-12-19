feature "Approve or reject booking request" do

  before do
    sign_up_test
    add_rental_feature
    click_button "Log Out"
    sign_up_bob

    click_on "Place 1"
    fill_in "date", with: '2019-05-04'
    click_on "Check Date"
    click_on "Book"

    click_button "Log Out"
    log_in_test
  end

  scenario "user can approve a request for their rental property" do
    click_on "Requests"
    click_on "Place 1"
    click_on "Confirm Request"

    expect(page).to have_content "Place 1"
    expect(page).to have_content "Booking confirmed"
  end
end
