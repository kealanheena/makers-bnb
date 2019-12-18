require_relative '../web_helpers.rb'

feature "booking" do

  scenario "can book a rental" do

        sign_up_test
        add_rentals

        visit "/"
        click_on "Place 1"
        click_on "Book"
        #will add date selection later
        expect(page).to have_content "Your booking request has been sent and is now pending approval."
  end

end
