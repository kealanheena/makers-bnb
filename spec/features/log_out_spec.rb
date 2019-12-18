feature "log in" do
  scenario "an existing user can log in" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "JDTest"
    fill_in "Email", with: "jd@test.com"
    fill_in "Password", with: "por85g"
    click_on "Sign Up"

    click_on "Log Out"
    expect(page).not_to have_content "Welcome JDTest!"
  end
end
