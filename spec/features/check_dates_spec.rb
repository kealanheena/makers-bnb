feature 'checking dates' do

  before do
    sign_up_test
    add_rental_feature
  end

  scenario 'it should show that a date is available' do
    click_on 'Place 1'
    fill_in 'date', with: '2019-05-04'
    click_on 'Check Date'

    expect(page).to have_content 'Date available!'
  end

  scenario 'it should show that a date is available' do
    click_on 'Place 1'
    fill_in 'date', with: '2020-12-01'
    click_on 'Check Date'

    expect(page).to have_content 'Not available'
  end
end
