require 'pg'
require 'bcrypt'

class User

attr_reader :username

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

      return "Email already exists" unless email_exists?(email: email)
      return "Username already exists" unless username_exists?(username: username)

      result = @connection.exec("INSERT INTO users(username, email, password)
        VALUES('#{username}', '#{email}', '#{encrypted_password}')
        RETURNING username, email, password, id, created_at;")

      User.new(username: result[0]["username"], email: result[0]["email"], password: result[0]["password"], id: result[0]["id"], created_at: result[0]["created_at"])
    end

    def self.authenticate(email:, password:)

      database_selector

      result = @connection.exec("SELECT * FROM users WHERE email='#{email}';")
      return false unless result.any?
      return false unless BCrypt::Password.new(result[0]["password"]) == password

      User.new(username: result[0]["username"], email: result[0]["email"], password: result[0]["password"], id: result[0]["id"], created_at: result[0]["created_at"])
    end


    private

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
