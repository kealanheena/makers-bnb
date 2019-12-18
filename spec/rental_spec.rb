require "rental"
require "pg"
require_relative './web_helpers.rb'

describe Rental do

  before do
    add_users_to_database
    Rental.add('Place 1', 'nice place', '20', '2020-05-16', '2020-06-18', 'JDTest')
    Rental.add('Place 2', 'great place', '30', '2020-06-18', '2020-07-20', 'JDTest')
  end

  describe ".all" do
    it "should return an array of rental instances" do
      expect(Rental.all.length).to eq(2)
      expect(Rental.all[0]).to be_an_instance_of(Rental)
    end
  end

  describe ".add" do
    it "should add a rental to the database" do
      expect(Rental.all.length).to eq(2)
      expect(Rental.all[0].name).to eq 'Place 1'
    end
  end

  describe ".check_date" do
    it 'should check if a date is available' do
      id = Rental.all[0].id
      expect(Rental.check_date(id, '2020-05-18')).to eq 'Date available!'
    end
  end
end
