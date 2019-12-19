class Booking

  def self.create(rental_name:, client_username:)
    database_selector

    client = @connection.exec("SELECT * FROM users WHERE username = '#{client_username}';")
    rental = @connection.exec("SELECT * FROM rentals WHERE name = '#{rental_name}';")
    client_id = client[0]["id"]
    rental_id = rental[0]["id"]

    @connection.exec("INSERT INTO bookings(rental_id, client_id)
      VALUES('#{rental_id}', '#{client_id}');")
  end

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bnb_test')
    else
      @connection = PG.connect(dbname: 'bnb')
    end
  end

end
