require 'booking'

describe Booking do

  let(:user) { double :user }
  let(:rental) { double :rental }

  before do
    add_users_to_database
    add_rentals_to_database
    Booking.create(rental_name: "Place 1", client_username: "helloBob")
    Booking.create(rental_name: "Place 2", client_username: "helloBob")
  end

  describe ".made" do
    it "displays all the bookings the user has made" do
      expect(Booking.made(client_username: "helloBob").length).to eq 2
      expect(Booking.made(client_username: "helloBob")[0]).to be_an_instance_of Booking
      expect(Booking.made(client_username: "helloBob")[0].status).to eq "Pending  "
      expect(Booking.made(client_username: "helloBob")[1].status).to eq "Pending  "
    end
  end

  describe ".received" do
    it "displays all the bookings the user has received for their rental property" do
      expect(Booking.received(owner_username: "JDTest").length).to eq 2
      expect(Booking.received(owner_username: "JDTest")[0][0]).to be_an_instance_of Booking
      expect(Booking.received(owner_username: "JDTest")[0][0].status).to eq "Pending  "
      expect(Booking.received(owner_username: "JDTest")[1][0].status).to eq "Pending  "
    end
  end

  describe ".update_status" do

    before do
      connection = PG.connect(dbname: 'bnb_test')
      rental = connection.exec("SELECT id FROM rentals WHERE name = 'Place 1';")
      rental_id = rental[0]["id"]

      booking = connection.exec("SELECT id FROM bookings WHERE rental_id = '#{rental_id}';")
      @booking_id = booking[0]["id"]
    end

    it "updates the booking status to Approved" do
      Booking.update_status(id: @booking_id, status: "Approved")

      expect(Booking.made(client_username: "helloBob")[1].status).to eq "Approved "
    end

    it "udpates the booking status to Rejected" do
      Booking.update_status(id: @booking_id, status: "Rejected")

      expect(Booking.made(client_username: "helloBob")[1].status).to eq "Rejected "
    end
  end

end
