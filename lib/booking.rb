class Booking

  attr_reader :status, :rental_id, :client_id, :status, :date, :id

  def initialize(id:, rental_id:, client_id:, status:, date:)
    @id = id
    @rental_id = rental_id
    @client_id = client_id
    @status = status
    @date = date
  end

  def self.create(rental_name:, client_username:, date:)
    database_selector

    client = @connection.exec("SELECT id FROM users WHERE username = '#{client_username}';")
    client_id = client[0]["id"]
    rental = @connection.exec("SELECT id FROM rentals WHERE name = '#{rental_name}';")
    rental_id = rental[0]["id"]

    @connection.exec("INSERT INTO bookings(rental_id, client_id, date)
      VALUES('#{rental_id}', '#{client_id}', '#{date}');")
  end


  def self.made(client_username:)
    database_selector

    client = @connection.exec("SELECT id FROM users WHERE username = '#{client_username}';")
    client_id = client[0]["id"]

    result = @connection.exec("SELECT * FROM bookings WHERE client_id = '#{client_id}';")
    result.map { |booking|
      Booking.new(id: booking['id'], rental_id: booking['rental_id'],
        client_id: booking['client_id'], status: booking['status'], date: booking['date'])
    }
  end

  def self.received(owner_username:)
    database_selector

    owner = @connection.exec("SELECT id FROM users WHERE username = '#{owner_username}';")
    owner_id = owner[0]["id"]

    rentals = @connection.exec("SELECT id FROM rentals WHERE user_id = '#{owner_id}';")
    rental_ids = []

    rentals.each { |rental|
      rental_ids << rental["id"]
    }

    rental_ids.map { |id|
      result = @connection.exec("SELECT * FROM bookings WHERE rental_id = '#{id}';")
      result.map { |booking|
        Booking.new(id: booking['id'], rental_id: booking['rental_id'],
          client_id: booking['client_id'], status: booking['status'], date: booking['date'])
      }
    }
  end

  def self.update_status(id:, status:, rental_id:)
    database_selector
    result = @connection.exec("UPDATE bookings SET status = '#{status}' WHERE id = '#{id}' AND rental_id='#{rental_id}';")
  end

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bnb_test')
    else
      @connection = PG.connect(dbname: 'bnb')
    end
  end

end
