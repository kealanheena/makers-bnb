require 'pg'
require 'date'

class Rental

  attr_reader :name, :description, :price, :id, :starting, :ending, :user_id

  def initialize(name:, description:, price:, id:, starting:, ending:, user_id:)
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
      Rental.new(name: dwelling['name'], description: dwelling['description'],
        price: dwelling['price'], id: dwelling['id'], starting: dwelling['start_date'],
        ending: dwelling['end_date'], user_id: dwelling['user_id'])
    }
  end

  def self.add(name:, description:, price:, starting:, ending:, username:)
    database_selector

    result = @connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    user_id = result[0]["id"]

    @connection.exec("INSERT INTO rentals(name, description, price, start_date, end_date, user_id)
      VALUES('#{name}', '#{description}', '#{price}', '#{starting}', '#{ending}', '#{user_id}');")
  end

  def self.rental_details(id:)
    database_selector

    query = "SELECT * FROM rentals WHERE id= '#{id}'"
    result = @connection.exec(query)

    Rental.new(name: result[0]["name"], description: result[0]["description"],
      price: result[0]["price"], id: result[0]["id"], starting: result[0]["start_date"],
      ending: result[0]["end_date"], user_id: result[0]["user_id"])
  end

  def self.check_date(id:, date:)
    rental = rental_details(id: id)
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
