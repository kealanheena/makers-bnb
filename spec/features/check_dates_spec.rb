

feature 'checking dates' do

  scenario 'it should check if a dates availabe to rent a property' do

    add_rentals
    visit '/'
    click_on 'Place 1'
    fill_in 'date', with: '04/05/2019'
    click_on 'Check Date'
    expect(page).to have_content 'Date available!'

  end

end