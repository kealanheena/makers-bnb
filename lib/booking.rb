class Booking

  attr_reader :status, :rental_id, :client_id, :status

  def initialize(id:, rental_id:, client_id:, status:)
    @id = id
    @rental_id = rental_id
    @client_id = client_id
    @status = status
  end

  def self.create(rental_name:, client_username:)
    database_selector

    client = @connection.exec("SELECT id FROM users WHERE username = '#{client_username}';")
    client_id = client[0]["id"]
    rental = @connection.exec("SELECT id FROM rentals WHERE name = '#{rental_name}';")
    rental_id = rental[0]["id"]

    @connection.exec("INSERT INTO bookings(rental_id, client_id)
      VALUES('#{rental_id}', '#{client_id}');")
  end


  def self.made(client_username:)
    database_selector

    client = @connection.exec("SELECT id FROM users WHERE username = '#{client_username}';")
    client_id = client[0]["id"]

    result = @connection.exec("SELECT * FROM bookings WHERE client_id = '#{client_id}';")
    result.map { |booking|
      Booking.new(id: booking['id'], rental_id: booking['rental_id'],
        client_id: booking['client_id'], status: booking['status'])
    }
  end

  def self.received(owner_username:)

  end

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bnb_test')
    else
      @connection = PG.connect(dbname: 'bnb')
    end
  end

end
