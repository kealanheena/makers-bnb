require 'pg'

class Rental
  attr_reader :name, :description, :price
  
  def initialize(name, description, price)
    @name = name
    @description = description
    @price = price
  end

  def self.all
    database_selector
    result = @connection.exec('SELECT * FROM rentals;')
    result.map {|dwelling|
      Rental.new(dwelling['name'], dwelling['description'], dwelling['price'])
    }
  end

  def self.add(name, description, price)
    database_selector
    @connection.exec("INSERT INTO rentals(name, description, price)
    VALUES('#{name}', '#{description}', '#{price}')")
  end

  private

  def self.database_selector
    if ENV['ENVIRONMENT'] = 'test'
      @connection = PG.connect(dbname: 'bnb_test')
    else
      @connection = PG.connect(dbname: 'bnb')
    end
  end
end