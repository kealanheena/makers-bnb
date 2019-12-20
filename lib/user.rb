require 'pg'
require 'bcrypt'

class User

  attr_reader :username, :email

  def initialize(username:, email:, password:, id:, created_at:)
    @username = username
    @email = email
    @password = password
    @id = id
    @created_at = created_at
  end

    def self.sign_up(username:, email:, password:)
      encrypted_password = BCrypt::Password.create(password)

      database_selector

      return :email_clash unless email_exists?(email: email)
      return :username_clash unless username_exists?(username: username)

      result = @connection.exec("INSERT INTO users(username, email, password)
        VALUES('#{username}', '#{email}', '#{encrypted_password}')
        RETURNING username, email, password, id, created_at;")

      User.new(username: result[0]["username"], email: result[0]["email"],
        password: result[0]["password"], id: result[0]["id"],
        created_at: result[0]["created_at"])
    end

    def self.authenticate(email:, password:)
      database_selector

      result = @connection.exec("SELECT * FROM users WHERE email='#{email}';")
      return false unless result.any?
      return false unless BCrypt::Password.new(result[0]["password"]) == password

      User.new(username: result[0]["username"], email: result[0]["email"],
        password: result[0]["password"], id: result[0]["id"],
        created_at: result[0]["created_at"])
    end

    def self.user_details(id:)
      database_selector

      query = "SELECT * FROM users WHERE id= '#{id}'"
      result = @connection.exec(query)

      User.new(username: result[0]["username"], email: result[0]["email"],
        password: result[0]["password"], id: result[0]["id"],
        created_at: result[0]["created_at"])
    end

    def self.rental_details(id:)
      database_selector

      query = "SELECT * FROM rentals WHERE id= '#{id}'"
      result = @connection.exec(query)

      Rental.new(name: result[0]["name"], description: result[0]["description"],
        price: result[0]["price"], id: result[0]["id"], starting: result[0]["start_date"],
        ending: result[0]["end_date"], user_id: result[0]["user_id"])
    end

    def self.database_selector
      if ENV['ENVIRONMENT'] == 'test'
        @connection = PG.connect(dbname: 'bnb_test')
      else
        @connection = PG.connect(dbname: 'bnb')
      end
    end

    def self.email_exists?(email:)
      database_selector

      result = @connection.exec("SELECT id FROM users WHERE email='#{email}';")
      return true unless result.any?
    end

    def self.username_exists?(username:)
      database_selector

      result = @connection.exec("SELECT id FROM users WHERE username='#{username}';")
      return true unless result.any?
    end
end
