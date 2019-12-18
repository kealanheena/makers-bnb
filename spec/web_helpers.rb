def add_rentals
  Rental.add('Place 1', 'nice place', '20', '2020-05-16', '2020-06-18', 'JDTest')
  Rental.add('Place 2', 'great place', '30', '2020-06-18', '2020-07-20', 'JDTest')
end

def add_rental_feature
  visit '/new'
  fill_in 'name', with: 'Place 1'
  fill_in 'description', with: 'Really really really nice place'
  fill_in 'price', with: '20'
  fill_in 'starting', with: '02/05/2019'
  fill_in 'ending', with: '30/07/2019'
  click_on 'Submit'
end

def sign_up_test
  # User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")
  visit "/"
  click_on "Sign Up"
  fill_in "Username", with: "JDTest"
  fill_in "Email", with: "jd@test.com"
  fill_in "Password", with: "por85g"
  click_on "Get Started"
end

def sign_up_user
  User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")
end
