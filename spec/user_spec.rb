require 'user'

describe "User" do

  before do
    @jd = sign_up_user
  end

  describe ".sign_up" do
    it "can sign up and create a new user" do

      expect(@jd).to be_instance_of User
      expect(@jd.username).to eq("JDTest")
    end

    it "fails to sign up if email already has an account" do
      expect(User.sign_up(username: "helloBob", email: "jd@test.com", password: "por85g")).to eq "Email already exists"
    end

    it "fails to sign up if username already has an account" do
      expect(User.sign_up(username: "JDTest", email: "hello@test.com", password: "super87")).to eq "Username already exists"
    end
  end

  describe ".authenticate" do
    it "can log in an existing user" do

      jd = User.authenticate(email: "jd@test.com", password: "por85g" )
      expect(jd).to be_instance_of User
      expect(jd.username).to eq("JDTest")
    end

     context "fails to log in if user is not recognized" do
      it "fails if wrong email" do
        expect(User.authenticate(email: "jc@taste.com", password: "por85g" )).to be false
      end

      it "fails if wrong password" do
        connection = PG.connect(dbname: 'bnb_test')
        connection.exec("TRUNCATE TABLE rentals, users, bookings;")
        expect(User.authenticate(email: "jd@test.com", password: "proc85g" )).to be false
      end
     end

  end
end
