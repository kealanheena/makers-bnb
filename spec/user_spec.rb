require 'user'

describe "User" do

  before do
    @user = User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")
  end

  describe ".sign_up" do
    it "can sign up and create a new user" do

      expect(@user).to be_instance_of User
      expect(@user.username).to eq("JDTest")
    end

    it "fails to sign up if email already has an account" do
      user = User.sign_up(username: "helloBob", email: "jd@test.com", password: "por85g")
      expect(user).to eq :email_clash
    end

    it "fails to sign up if username already has an account" do
      user = User.sign_up(username: "JDTest", email: "hello@test.com", password: "super87")
      expect(user).to eq :username_clash
    end
  end

  describe ".authenticate" do
    it "can log in an existing user" do

      user = User.authenticate(email: "jd@test.com", password: "por85g" )
      expect(user).to be_instance_of User
      expect(user.username).to eq("JDTest")
    end

    context "fails to log in if user is not recognized" do
      it "fails if wrong email" do
        user = User.authenticate(email: "jc@taste.com", password: "por85g" )
        expect(user).to be false
      end

      it "fails if wrong password" do
        user = User.authenticate(email: "jd@test.com", password: "proc85g" )
        expect(user).to be false
      end
    end
  end
end
