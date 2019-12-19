def sign_up_test
  visit "/"
  click_on "Sign Up"
  fill_in "Username", with: "JDTest"
  fill_in "Email", with: "jd@test.com"
  fill_in "Password", with: "por85g"
  click_on "Get Started"
end

def sign_up_bob
  visit "/"
  click_on "Sign Up"
  fill_in "Username", with: "helloBob"
  fill_in "Email", with: "bob@test.com"
  fill_in "Password", with: "testPassword"
  click_on "Get Started"
end

def log_in_test
  visit "/"
  click_link "Log In"
  fill_in "Email", with: "jd@test.com"
  fill_in "Password", with: "por85g"
  click_on "Sign In"
end

def add_rental_feature
  click_on 'Add Rental'
  fill_in 'name', with: 'Place 1'
  fill_in 'description', with: 'Really really really nice place'
  fill_in 'price', with: '20'
  fill_in 'starting', with: '2019/05/02'
  fill_in 'ending', with: '2019/07/30'
  click_on 'Submit'

  click_on 'Add Rental'
  fill_in 'name', with: 'Place 2'
  fill_in 'description', with: 'Picturesque location on a lake'
  fill_in 'price', with: '30'
  fill_in 'starting', with: '2019/05/02'
  fill_in 'ending', with: '2019/07/30'
  click_on 'Submit'
end
