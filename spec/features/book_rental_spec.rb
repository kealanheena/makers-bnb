feature "booking" do

  scenario "can book a rental" do
    sign_up_test
    add_rental_feature

    click_on "Place 1"
    #will add date selection later
    click_on "Book"
    text = "Your booking request has been sent and is now pending approval."
    expect(page).to have_content text
  end
end
