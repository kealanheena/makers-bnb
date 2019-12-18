feature "log in" do
  scenario "an existing user can log in" do

    clear_database
    User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")

    visit "/"
    click_link "Log In"
    fill_in "Email", with: "jd@test.com"
    fill_in "Password", with: "por85g"
    click_on "Sign In"
    expect(page).to have_content "Welcome JDTest!"
  end

  scenario "if email is incorrect, an error message is displayed" do
    User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")

    visit "/"
    click_link "Log In"
    fill_in "Email", with: "jc@test.com"
    fill_in "Password", with: "por85g"
    click_on "Sign In"
    expect(page).to have_content "Incorrect login details, please try again!"
  end

  scenario "if password is incorrect, an error message is displayed" do
    User.sign_up(username: "JDTest", email: "jd@test.com", password: "por85g")

    visit "/"
    click_link "Log In"
    fill_in "Email", with: "jd@test.com"
    fill_in "Password", with: "proc85g"
    click_on "Sign In"
    expect(page).to have_content "Incorrect login details, please try again!"
  end

end
