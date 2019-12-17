feature 'add rental' do

  scenario 'should add a rental to the listings' do
    visit '/'
    click_on 'Add Rental'
    fill_in 'name', with: 'Place 1'
    fill_in 'description', with: 'Really really really nice place'
    fill_in 'price', with: '20'
    click_on 'Submit'
    expect(page).to have_content 'Place 1'
    expect(page).to have_content 'Really really really nice place'
    expect(page).to have_content 'Price Per Night: £20'
  end

end
