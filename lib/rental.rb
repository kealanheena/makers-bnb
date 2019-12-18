require 'pg'
require 'date'

class Rental
  attr_reader :name, :description, :price, :id, :starting, :ending, :user_id
  
  def initialize(name, description, price, id, starting, ending)
    @name = name
    @description = description
    @price = price
    @id = id
    @starting = DateTime.parse(starting)
    @ending = DateTime.parse(ending)
    @user_id = user_id
  end

  def self.all
    database_selector
    result = @connection.exec('SELECT * FROM rentals;')
    result.map {|dwelling|
      Rental.new(dwelling['name'], dwelling['description'], dwelling['price'], dwelling['id'], dwelling['start_date'], dwelling['end_date'])
    }
  end

  def self.add(name, description, price, starting, ending)
    database_selector
    @connection.exec("INSERT INTO rentals(name, description, price, start_date, end_date)
    VALUES('#{name}', '#{description}', '#{price}', DATE '#{starting}', DATE '#{ending}')")
  end

  def self.rental_details(id)
    database_selector
    query = "SELECT * FROM rentals WHERE id= '#{id}'"
    result = @connection.exec(query)
    Rental.new(result[0]["name"], result[0]["description"], result[0]["price"], result[0]["id"], result[0]["start_date"], result[0]["end_date"])
  end

  def self.check_date(id, date)

    rental = Rental.rental_details(id)
    parsed_date = DateTime.parse(date)
    parsed_date.between?(rental.starting, rental.ending) ? "Date available!" : "Not available"
    
  end

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bnb_test')
    else
      @connection = PG.connect(dbname: 'bnb')
    end
  end
end