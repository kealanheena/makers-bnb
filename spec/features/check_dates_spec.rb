feature 'checking dates' do

  scenario 'it should check if a dates availabe to rent a property' do
    sign_up_test
    add_rental_feature

    click_on 'Place 1'
    fill_in 'date', with: '2019-05-04'
    click_on 'Check Date'

    expect(page).to have_content 'Date available!'
  end

end
