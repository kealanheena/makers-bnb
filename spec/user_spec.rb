require 'user'

describe "User" do

  before do
    clear_database
    @jd = User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")
  end

  it "can sign up and create a new user" do

    expect(@jd).to be_instance_of User
    expect(@jd.username).to eq("JDTest")
  end

  describe ".authenticate" do
    it "can log in an existing user" do

      jd = User.authenticate(email: "jd@test.com", password: "por85g" )
      expect(jd).to be_instance_of User
      expect(jd.username).to eq("JDTest")
    end

    context "fails to log in if user is not recognized" do
      it "fails if wrong email" do
        expect(User.authenticate(email: "jc@taste.com", password: "por85g" )).not_to be true
      end

      it "fails if wrong password" do
        expect(User.authenticate(email: "jd@test.com", password: "proc85g" )).not_to be true
      end

    end

  end
end
