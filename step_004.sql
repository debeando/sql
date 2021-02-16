DROP TABLE IF EXISTS address;

CREATE TABLE IF NOT EXISTS address (
  id BIGINT NOT NULL AUTO_INCREMENT,
  user_id CHAR(36) NOT NULL,
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

insert into address (user_id, country, city, address) values ('faa72ef9-6576-11eb-9caa-0242ac110002', 'Italia', 'Veneto', 'Via batisti 22');
insert into address (user_id, country, city, address, address_type) values ('faa72ef9-6576-11eb-9caa-0242ac110002', 'Spain', 'Barcelona', 'Carrer ....', 'Billing');
insert into address (user_id, country, city, address) values ('abc', 'Spain', 'Barcelona', 'Carrer ....');


select u.id, u.user_id, email, a.city
from users AS u
join address AS a on u.user_id = a.user_id
where u.user_id = 'abc';
