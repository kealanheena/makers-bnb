CREATE TABLE bookings(id SERIAL PRIMARY KEY, rental_id INT NOT NULL,
  client_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  status char(9) DEFAULT 'Pending', date DATE);

ALTER TABLE bookings ADD CONSTRAINT constraint_fk FOREIGN KEY (client_id) REFERENCES users(id);
ALTER TABLE bookings ADD CONSTRAINT constraint_fk2 FOREIGN KEY (rental_id) REFERENCES rentals(id);
