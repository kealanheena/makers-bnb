# Makers BNB


## Table of contents
- [MVP](#mvp)
- [User Stories](#user-stories)
- [Domain Modelling](#domain-modelling)
- [Database Structures](#database-structures)
- [Getting started](#getting-started)
- [Database setup](#database-setup)
- [Test database setup](#test-database-setup)

## MVP

As a user  
So I can book somewhere fun to go on holiday  
I want to see a list of available accommodation  

As a user  
So I can provide a space to rent  
I want to add it to the listings  

As a user  
So I can book somewhere fun to go  
I want to be able to book a space   


## User Stories

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
