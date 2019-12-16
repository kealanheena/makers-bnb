require 'pg'

class User

attr_reader :username

  def initialize(username:, email:, password:, id:, created_at:)
    @username = username
    @email = email
    @password = password
  end

    def self.sign_up(username:, email:, password:)
      if ENV['RACK_ENV'] == 'test'
        @connection = PG.connect(dbname: 'bnb_test')
      else
        @connection = PG.connect(dbname: "bnb")
      end

      result = @connection.exec("INSERT INTO users(username, email, password)
        VALUES('#{username}', '#{email}', '#{password}')
        RETURNING username, email, password, id, created_at;")

      User.new(username: result[0]["username"], email: result[0]["email"], password: result[0]["password"], id: result[0]["id"], created_at: result[0]["created_at"])
    end

end
