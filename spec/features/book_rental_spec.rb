feature "booking" do

  scenario "can book a rental" do
    sign_up_test
    add_rental_feature
    click_button "Log Out"
    sign_up_bob

    click_on "Place 1"
    fill_in "date", with: '2019-05-04'
    click_on "Check Date"
    click_on "Book"

    expect(page).to have_content "Your booking request has been sent and is now pending approval."
  end
end
