class User

attr_reader :username

  def initialize(username:, email:, password:)
    @username = username
    @email = email
    @password = password
  end

    def self.sign_up(username:, email:, password:)
      User.new(username: username, email: email, password: password)
    end

end
