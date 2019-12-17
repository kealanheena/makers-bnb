feature "Sign up" do
  scenario "a new user can sign up" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "JDTest"
    fill_in "Email", with: "jd@test.com"
    fill_in "Password", with: "por85g"
    click_on "Sign Up"
    expect(page).to have_content "Welcome JDTest!"
  end
end
