ALTER TABLE rentals ADD user_id INT NOT NULL;

ALTER TABLE rentals ADD CONSTRAINT constraint_fk FOREIGN KEY (user_id) REFERENCES users(id);
