require 'pg'
require 'bcrypt'

def add_users_to_database
  connection = PG.connect(dbname: 'bnb_test')

  encrypted_password = BCrypt::Password.create('helloPassword')
  connection.exec("INSERT INTO users(username, email, password)
    VALUES('JDTest','jd@test.com', '#{encrypted_password}');")

  encrypted_password2 = BCrypt::Password.create('testPassword')
  connection.exec("INSERT INTO users(username, email, password)
    VALUES('helloBob','bob@test.com', '#{encrypted_password2}');")
end

def add_rentals_to_database
  connection = PG.connect(dbname: 'bnb_test')
  result = connection.exec("SELECT * FROM users WHERE username = 'JDTest';")
  user_id = result[0]["id"]

  connection.exec("INSERT INTO rentals(name, description, price, user_id)
    VALUES('Place 1','eally really really nice place', '20',
      '#{user_id}');")

  connection.exec("INSERT INTO rentals(name, description, price, user_id)
    VALUES('Place 2','Picturesque location on a lake', '20',
      '#{user_id}');")
end
