require "rental"
require "pg"

describe Rental do
  describe "#all" do
    it "should return an array of rental instances" do
      add_rentals
      expect(Rental.all.length).to eq(2)
      expect(Rental.all[0]).to be_an_instance_of(Rental)
    end
  end

  describe "#add" do
    it "should add a rental to the database" do
      add_rentals
      expect(Rental.all.length).to eq(1)
      expect(Rental.all[0].name).to eq 'Place 1'
    end
  end
end