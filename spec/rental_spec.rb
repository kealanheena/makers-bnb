require "rental"
require "pg"
require_relative './web_helpers.rb'

describe Rental do
  describe "#all" do
    it "should return an array of rental instances" do
      add_users_to_database
      add_rentals
      expect(Rental.all.length).to eq(2)
      expect(Rental.all[0]).to be_an_instance_of(Rental)
    end
  end

  describe "#add" do
    it "should add a rental to the database" do
      add_users_to_database
      add_rentals
      expect(Rental.all.length).to eq(2)
      expect(Rental.all[0].name).to eq 'Place 1'
    end
  end

  describe "#check_date" do
    it 'should check if a date is available' do
      add_users_to_database
      add_rentals
      id = Rental.all[0].id
      expect(Rental.check_date(id, '2020-05-18')).to eq 'Date available!'
    end
  end
end
