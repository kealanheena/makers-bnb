# Makers BNB


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
So I can view all requests for my rental  
I want to see booking requests  

As a user  
So I can feel safe about renting out my space  
I want to be able to approve booking requests  

As a user  
So I know my booking has been successful  
I want to see a notification of approval  

As a user  
To prevent double-bookings on my rental  
I only want available dates to be viewable  

As a user  
So I can choose who books my property  
I want the booking to be available until I confirm a booking request  

## Domain Modelling

| User |Booking | Rental |
| --- | --- | --- |
| @email | @rental | @name |
| @password | @dates |  @description |
| @username | @client | @price_per_night |
| --------- | -------- | -------- |
| .sign_up |(.calculate_price) | .set_dates |
| .log_in | .show_request | self.all |
| .log_out | .confirm_booking | self.create |
| .see_requests | | .request(date) |
|  | | .check(date) |

## Database Structures

**Table: Users**

| user_id | username | email | password | created_at |
| ----- | --------- | ----- | -------- | ---------- |
| 1 | Debbie Handler | debbie@test.com | dkfg14   | 2019-12-08 21:02:31.579223 |
| 2 | Joan Peeler | jojo@test.com   | j450pl   | 2019-12-08 21:02:31.579223 |  

**Table: Rentals**   

| id | name | description | price_per_night | created_at | user_id | dates_available
| -- | ------- | ---------- | ------- | ----- | ----- | ---- |
| 1 | Buckingham Palace | A warm, cozy and small cottage in London | £10,000.50 | 2019-12-08 21:02:55.919516 | 1 | 2019-12-24, 2019-12-25 |
| 2 | V&A Museum | Filled with light and portraits | £360.00 | 2019-12-08 21:02:55.919516 | 2 | 2019-12-24, 2019-12-25 |
| 3 | Tent in field with mines | For the adrenaline junkies | £5.00 | 2019-12-08 21:02:55.919516 | 2 |  2019-12-24, 2019-12-25 |

**Table: Bookings**  

| id | rental_id | user_id (booker) | dates | created_at |
| -- | ------- | ---------- | ------- | ------ |
| 1 | 1 | 1 | 2019-12-24 |  2019-12-08 21:02:55.919516 |
| 2 | 2 | 3 | 2020-02-19 | 2019-12-08 21:02:55.919516 |
| 3 | 2 | 2 | 2020-08-01 | 2019-12-08 21:02:55.919516 |  

## Features  
- Sign up

## Code style
- OOD
- TDD
- BDD

## Tech used
- Ruby  
- Rspec  
- Sinatra  
- Capybara  
- PostgreSQL  

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

You can run tests by running "rspec" in the terminal in the makers-bnb directory.

### Test coverage  
#### Feature tests
#### Unit tests

## Versioning
makers-bnb uses ruby version 2.6.5. To change ruby versions run
```rvm install ruby-2.6.5``` in terminal.
