CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  password_digest VARCHAR(100)
);

ALTER TABLE users ADD COLUMN phone_number VARCHAR(20);

INSERT INTO users(name, email, phone_number) VALUES ('speedy', 'outtatime@email.com', '0411222333');
INSERT INTO users(name, email, phone_number) VALUES ('johnc', 'john@citizen.com', '0412223334');
INSERT INTO users(name, email, phone_number) VALUES ('katew', 'katewilson@email.com', '0412345678');
INSERT INTO users(name, email, phone_number) VALUES ('ryan', 'ryan@email.com', '0411987654');

CREATE TABLE items (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  title VARCHAR(200),
  description VARCHAR(400),
  condition VARCHAR(200),
  price DECIMAL,
  life_span INTEGER,
  latitude DECIMAL,
  longitude DECIMAL,
  created_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id)
);

ALTER TABLE items ADD COLUMN collected BOOLEAN;


INSERT INTO items(user_id, title, description, condition, price) VALUES (3, 'Can of Solo', 'This came bundled with my lunch but I dont need it', 'unopened', 2);
INSERT INTO items(user_id, title, description, condition, price, sold) VALUES (2, 'bag of baby spinach', 'Going away tonight, I would rather it get used', 'unopened', 0, TRUE);

ALTER TABLE items ADD COLUMN sold BOOLEAN;

CREATE TABLE purchases (
  id SERIAL4 PRIMARY KEY,
  item_id INTEGER,
  seller_id INTEGER,
  buyer_id INTEGER,
  created_at TIMESTAMP,
  CONSTRAINT fk_seller_id FOREIGN KEY (seller_id) REFERENCES users (id),
  CONSTRAINT fk_buyer_id FOREIGN KEY (buyer_id) REFERENCES users (id),
  CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES items (id)
);

ALTER TABLE purchases DROP COLUMN seller_id;
ALTER TABLE purchases RENAME COLUMN buyer_id TO user_id;

INSERT INTO purchases(item_id, seller_id, buyer_id) VALUES (4, 2, 19);



