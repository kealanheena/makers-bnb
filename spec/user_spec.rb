require 'user'

describe "User" do

  it "can sign in and create a new user" do
    clear_database
    jd = User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")
    expect(jd).to be_instance_of User
    expect(jd.username).to eq("JDTest")
  end
end
