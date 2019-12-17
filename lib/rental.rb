require 'pg'

class Rental
  attr_reader :name, :description, :price, :id
  
  def initialize(name, description, price, id)
    @name = name
    @description = description
    @price = price
    @id = id
  end

  def self.all
    database_selector
    result = @connection.exec('SELECT * FROM rentals;')
    result.map {|dwelling|
      Rental.new(dwelling['name'], dwelling['description'], dwelling['price'], dwelling['id'])
    }
  end

  def self.add(name, description, price)
    database_selector
    @connection.exec("INSERT INTO rentals(name, description, price)
    VALUES('#{name}', '#{description}', '#{price}')")
  end

  def self.rental_details(id)
    database_selector
    result = @connection.exec("SELECT * FROM rentals WHERE id= '#{id}'")
    Rental.new(result[0]["name"], result[0]["description"], result[0]["price"], result[0]["id"])
  end

  def self.database_selector
    if ENV['ENVIRONMENT'] = 'test'
      @connection = PG.connect(dbname: 'bnb_test')
    else
      @connection = PG.connect(dbname: 'bnb')
    end
  end
end