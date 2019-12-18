feature 'add rental' do

  scenario 'should add a rental to the listings' do
    sign_up_test
    add_rental_feature
    expect(page).to have_content 'Place 1'
    expect(page).to have_content 'Really really really nice place'
    expect(page).to have_content 'Price Per Night: £20'
  end

  scenario 'should be able to add set of available dates to rental' do
    sign_up_test
    add_rental_feature
    expect(page).to have_content '2019-05-02'
    expect(page).to have_content '2019-07-30'
  end
end
