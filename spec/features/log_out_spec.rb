feature "log out" do
  scenario "an existing user can log out" do
    visit "/"
    click_on "Sign Up"
    fill_in "Username", with: "JDTest"
    fill_in "Email", with: "jd@test.com"
    fill_in "Password", with: "por85g"
    click_on "Get Started"

    click_button "Log Out"
    expect(page).not_to have_content "Welcome JDTest!"
  end
end
