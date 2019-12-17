CREATE TABLE rentals(id SERIAL PRIMARY KEY, name varchar(60),
  description varchar(250), price numeric(5, 2),
  created_at TIMESTAMP NOT NULL DEFAULT NOW(), user_id numeric, start_date DATE, end_date DATE);
