require "rental"
require "pg"

describe Rental do

  before do
    add_users_to_database
    Rental.add(name: 'Place 1', description: 'nice place', price: '20',
      starting: '2020-05-16', ending: '2020-06-18', username: 'JDTest')
    Rental.add(name: 'Place 2', description: 'great place', price: '30',
      starting: '2020-06-18', ending: '2020-07-20', username: 'JDTest')
  end

  describe ".add" do
    it "should add a rental to the database" do
      expect(Rental.all.length).to eq(2)
      expect(Rental.all[0].name).to eq 'Place 1'
    end
  end

  describe ".all" do
    it "should return an array of rental instances" do
      expect(Rental.all.length).to eq(2)
      expect(Rental.all[0]).to be_an_instance_of(Rental)
    end
  end

  describe ".check_date" do
    it 'should return that date is available if it is' do
      id = Rental.all[0].id
      expect(Rental.check_date(id: id, date: '2020-05-18')).to eq 'Date available!'
    end

    it "should return that date is not available if it isn't" do
      id = Rental.all[0].id
      expect(Rental.check_date(id: id, date: '2020-07-18')).to eq 'Not available'
    end
  end
end
