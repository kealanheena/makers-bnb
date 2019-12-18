feature 'checking dates' do

  scenario 'it should check if a dates availabe to rent a property' do
    sign_up_test
    add_rental_feature

    click_on 'Place 1'
    fill_in 'date', with: '04/05/2019'
    click_on 'Check Date'

    expect(page).to have_field('#date-checker', with: 'Date available!')
  end

end
