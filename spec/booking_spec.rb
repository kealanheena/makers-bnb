require 'booking'
describe Booking do

  let(:user) { double :user }
  let(:rental) { double :rental }

  before do
    add_users_to_database
    add_rentals_to_database
  end

  # describe ".create" do
  #   it "creates a new booking" do
  #
  #     bk = Booking.create(rental_name: "Place 1", client_username: "JDTest")
  #     expect(bk).to be_instance_of Booking
  #   end
  # end

  describe ".made" do
    it "displays all the bookings the user has made" do

    end
  end

end
