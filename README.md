# Makers BNB

This is the first Makers team project, working together to build an AirBnB clone. Helping us develop teamwork, project management and technical skills.

## Table of contents
- [User Stories](#user-stories)
- [Domain Modelling](#domain-modelling)
- [Database Structures](#database-structures)
- [Features](#features)
- [Code style](#code-style)
- [Tech used](#tech-used)
- [Getting started](#getting-started)
- [Database setup](#database-setup)
- [Test database setup](#test-database-setup)
- [Running the tests](#running-the-tests)
  - [Test coverage](#test-coverage)
    - [Feature tests](#feature-tests)
    - [Unit tests](#unit-tests)
- [Versioning](#versioning)  

## User Stories

As a user  
So I can book somewhere fun to go on holiday  
I want to see a list of available rentals    

As a user  
So I can make money from letting out my space  
I want to add it to the listings  

As a user  
So I can access the listings of rentals  
I want to be able to sign up  

As a user  
So I can book somewhere fun to go  
I want to be able to book a rental    

As a user  
So that my rental is more visible for booking  
I want to give it a name, description and price per night  

As a user  
So customers know when my rental is available  
I want to assign it available dates  

As a user  
So others cannot use my account to make bookings  
I want to log out when I am finished on the site  

As a user  
So I can revisit the site and make further bookings  
I want to log in if I already have an account  

As a user  
So I can stay at a rental for a night  
I want to make a booking request for that rental  

As a user  
So I know my booking has been successful  
I want to see a notification of approval  

As a user  
So I can view all requests for my rental  
I want to see booking requests  

As a user  
So I can feel safe about renting out my space  
I want to be able to approve booking requests  

As a user  
To prevent double-bookings on my rental  
I only want available dates to be viewable  

As a user  
So I can choose who books my property  
I want the booking to be available until I confirm a booking request  

## Domain Modelling

| User |Booking | Rental |
| --- | --- | --- |
| @email | @rental_id | @name |
| @password | @date |  @description |
| @username | @client_id (booker) | @price_per_night |
| @id | @id | @id |
| | | @starting_date |
| | | @ending_date |
| | | @user_id (owner of rental) |
| --------- | -------- | -------- |
| self.sign_up | self.create | self.all |
| self.authenticate | self.made | self.add |
| | self.received | self.check_date |
| | self.update_status | |

## Database Structures

**Table: Users**

| id | username | email | password | created_at |
| ----- | --------- | ----- | -------- | ---------- |
| 1 | Debbie Handler | debbie@test.com | dkfg14 | 2019-12-08 21:02:31.579223 |
| 2 | Joan Peeler | jojo@test.com | j450pl | 2019-12-08 21:02:31.579223 |  

**Table: Rentals**   

| id | name | description | price(£) | created_at | start_date | end_date | user_id |
| -- | ------- | ----- | ---- | ----- | ----- | ---- | --- |
| 1 | Buckingham Palace | A warm, cozy and small cottage in London | 10000.50 | 2019-12-08 21:02:55.919516 | 2020-01-01 00:00:00.000000 |  2020-02-30 00:00:00.000000 | 1 |
| 2 | V&A Museum | Filled with light and portraits | 360.00 | 2019-12-08 21:02:55.919516 | 2020-03-01 00:00:00.000000 |  2020-04-15 00:00:00.000000 | 2 |
| 3 | Tent in field with mines | For the adrenaline junkies | 5.00 | 2019-12-08 21:02:55.919516 | 2020-01-02 00:00:00.000000 | 2020-12-10 00:00:00.000000 | 2 |

**Table: Bookings**  

| id | rental_id | client_id | date | created_at | status(default: pending) |
| --- | ----- | ------ | ------- | ------ | ------ |
| 1 | 1 | 1 | 2019-12-24 | 2019-12-08 21:02:55.919516 | pending |
| 2 | 2 | 3 | 2020-02-19 | 2019-12-08 21:02:55.919516 | approved |
| 3 | 2 | 2 | 2020-08-01 | 2019-12-08 21:02:55.919516 | rejected |


## Features  
- Sign up
- Log in
- Log out
- Add rental
- Book rental for one night (by date)
- See bookings you've made
- See bookings you've received
- Approve received bookings
- Reject received bookings
- Visual confirmation of booking status on requests page

## Code style
- OOD
- TDD
- BDD
- Pairing
- Mobbing
- XP

## Tech used
- Ruby  
- Rspec  
- Sinatra  
- Capybara  
- PostgreSQL  
- Bootstrap
- CSS
- ERB

## Getting started

Run the below in the terminal in your makers-bnb directory:
- To install all necessary gems, run ```bundle```
- To open in web browser run ```ruby app.rb```
- Open http://localhost:4567/

## Database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE bnb;```  
- Connect to the database using the ```psql``` command ```\c bnb;```  
- Run all the queries we have saved in the folder ```db\migrations\```  

## Test database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE bnb_test;```  
- Connect to the database using the ```psql``` command ```\c bnb_test;```  
- Run all the queries we have saved in the folder ```db\migrations\```  

## Running the tests  

You can run tests by running ```rspec``` in the terminal in the makers-bnb directory.

### Test coverage  
#### Feature tests

- Rentals list
  - should see a list of rentals without being logged in
  - should see a list of rentals if logged in

- Sign up
  - a new user can sign up
  - a message appears if email already has an account
  - a message appears if username is already taken

- Log in
  - an existing user can log in
  - if email is incorrect, an error message is displayed
  - if password is incorrect, an error message is displayed

- Log out
  - an existing user can log out

- Add rental
  - should add a rental to the listings

- Booking
  - can book a rental

- Checking dates
  - it should show that a date is available
  - it should show that a date is not available
  - it should show a date is unavailable if booking confirmed for that date

- Requests page
  - shows a list of all bookings made by logged-in user
  - shows a list of all requests made for the logged-in user's rentals

- Approve or reject booking request
  - user can approve a request for their rental property
  - user can reject a request for their rental property

#### Unit tests

**User**
- .sign_up
  - can sign up and create a new user
  - fails to sign up if email already has an account
  - fails to sign up if username already has an account
- .authenticate
  - can log in an existing user
  - fails to log in if user is not recognized
     - fails if wrong email
     - fails if wrong password

**Rental**
- .all
  - should return an array of rental instances
- .add
  - should add a rental to the database
- .rental_details
  - should show the details of a rental
- .check_date
  - should return that date is available if it is
  - should return that date is not available if it isn't

**Booking**
- .made
  - displays all the bookings the user has made
- .received
  - displays all the bookings the user has received for their rental property
- .update_status
  - updates the booking status to Approved
  - udpates the booking status to Rejected

## Versioning
makers-bnb uses ruby version 2.6.5. To change ruby versions run
```rvm install ruby-2.6.5``` in terminal.
