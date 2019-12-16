# Makers BNB

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

| User |Booking | Space |
| --- | --- | --- |
| @email | @space | @name |
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

**Table: Spaces**   

| id | name | description | price_per_night | created_at | user_id |
| -- | ------- | ---------- | ------- | ----- | ----- |
| 1 | Buckingham Palace | A warm, cozy and small cottage in London | £10,000.50 | 2019-12-08 21:02:55.919516 | 1 |
| 2 | V&A Museum | Filled with light and portraits | £360.00 | 2019-12-08 21:02:55.919516 | 2 |
| 3 | Tent in field with mines | For the adrenaline junkies | £5.00 | 2019-12-08 21:02:55.919516 | 2 |  

**Table: Bookings**  

| id | space_id | user_id (booker) | dates | created_at |
| -- | ------- | ---------- | ------- | ------ |
| 1 | 1 | 1 | 2019-12-24 |  2019-12-08 21:02:55.919516 |
| 2 | 2 | 3 | 2020-02-19 | 2019-12-08 21:02:55.919516 |
| 3 | 2 | 2 | 2020-08-01 | 2019-12-08 21:02:55.919516 |  
