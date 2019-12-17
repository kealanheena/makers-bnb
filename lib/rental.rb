require 'pg'

class Rental
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def self.all
    connection = PG.connect(dbname: 'bnb')
    result = connection.exec('SELECT * FROM rentals;')

    result.map {|dwelling|
      Rental.new(dwelling['name'])
    }
  end
end