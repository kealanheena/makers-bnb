def sign_up_test
  visit "/"
  click_on "Sign Up"
  fill_in "Username", with: "JDTest"
  fill_in "Email", with: "jd@test.com"
  fill_in "Password", with: "por85g"
  click_on "Get Started"
end

def add_rental_feature
  click_on 'Add Rental'
  fill_in 'name', with: 'Place 1'
  fill_in 'description', with: 'Really really really nice place'
  fill_in 'price', with: '20'
  fill_in 'starting', with: '02/05/2019'
  fill_in 'ending', with: '30/07/2019'
  click_on 'Submit'
end
