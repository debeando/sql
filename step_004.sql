DROP TABLE IF EXISTS address;

CREATE TABLE IF NOT EXISTS address (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NOT NULL,
  address_status ENUM('Inactive','Active') DEFAULT 'Inactive' NOT NULL,
  address_type ENUM('Billing','Shipping') DEFAULT 'Shipping' NOT NULL,
  country VARCHAR(64) NOT NULL,
  city VARCHAR(64) NOT NULL,
  address VARCHAR(64) NOT NULL,
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  delete_at TIMESTAMP,
  PRIMARY KEY (id)
);

ALTER TABLE address
ADD CONSTRAINT address_users
FOREIGN KEY (user_id)
REFERENCES  users(id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

INSERT INTO address (user_id, country, city, address) values (1, 'Italia', 'Veneto', 'Via batisti 22');
INSERT INTO address (user_id, country, city, address, address_type) values (1, 'Spain', 'Barcelona', 'Carrer ....', 'Billing');
INSERT INTO address (user_id, country, city, address) values (2, 'Spain', 'Barcelona', 'Carrer ....');

SELECT u.id, u.user_id, email, a.city
FROM users AS u
JOIN address AS a
  ON u.user_id = a.user_id
WHERE u.user_id = 'abc';
