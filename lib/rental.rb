require 'pg'

class Rental
  attr_reader :name, :description, :price, :id, :user_id

  def initialize(name, description, price, id, user_id)
    @name = name
    @description = description
    @price = price
    @id = id
    # @starting = starting
    # @ending = ending
    @user_id = user_id
  end

  def self.all
    database_selector
    result = @connection.exec('SELECT * FROM rentals;')
    result.map {|dwelling|
      Rental.new(dwelling['name'], dwelling['description'], dwelling['price'], dwelling['id'], dwelling['user_id'])
    }
  end

  def self.add(name, description, price, username)
    database_selector

    result = @connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    user_id = result[0]["id"]

    @connection.exec("INSERT INTO rentals(name, description, price, user_id)
    VALUES('#{name}', '#{description}', '#{price}', '#{user_id}');")

  end

  def self.rental_details(id)
    database_selector
    result = @connection.exec("SELECT * FROM rentals WHERE id= '#{id}'")
    Rental.new(result[0]["name"], result[0]["description"], result[0]["price"], result[0]["id"], result[0]["user_id"])
  end

  # def self.check_date(id, date)
  #   database_selector
  #   result = @connection.exec("SELECT name FROM rentals WHERE id = '#{id}'
  #   AND ('#{date}' BETWEEN start_date AND end_date)")
  #   'Date available!' if result
  # end

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bnb_test')
    else
      @connection = PG.connect(dbname: 'bnb')
    end
  end
end
