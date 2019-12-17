require "rental"
require "pg"

describe Rental do
  describe "#all" do
    it "should return an array of rental instances" do
      expect(Rental.all.length).to eq(2)
    end
  end
end