feature "Sign up" do
  scenario "a new user can sign up" do
    clear_database
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "JDTest"
    fill_in "Email", with: "jd@test.com"
    fill_in "Password", with: "por85g"
    click_on "Sign Up"
    expect(page).to have_content "Welcome JDTest!"
  end

  scenario "a message appears if email already has an account" do
    clear_database
    User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "helloBob"
    fill_in "Email", with: "jd@test.com"
    fill_in "Password", with: "por85g"
    click_on "Sign Up"
    expect(page).to have_content "Email already has an account, please try again."
  end

  scenario "a message appears if username is already taken" do
    clear_database
    User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "JDTest"
    fill_in "Email", with: "bob_says_hello@test.com"
    fill_in "Password", with: "password"
    click_on "Sign Up"
    expect(page).to have_content "This username is already taken, please choose another one."
  end
end
