def add_rentals
  Rental.add('Place 1', 'nice place', '20', "02/05/2020", "30/07/2020")
  Rental.add('Place 2', 'great place', '30', "30/08/2020", "17/09/2020")
end

def add_rental_feature
  fill_in 'name', with: 'Place 1'
  fill_in 'description', with: 'Really really really nice place'
  fill_in 'price', with: '20'
  fill_in 'starting', with: '02/05/2019'
  fill_in 'ending', with: '30/07/2019'
  click_on 'Submit'
end
