DROP TABLE IF EXISTS users;

-- Creamos las primeras tablas:
CREATE TABLE IF NOT EXISTS users (
  id BIGINT NOT NULL AUTO_INCREMENT,
  user_id CHAR(36) NOT NULL,
  email CHAR(255) NOT NULL,
  username VARCHAR(64) NOT NULL,
  encrypted_password CHAR(40) NOT NULL,
  user_status ENUM('Inactive','Active') DEFAULT 'Inactive' NOT NULL,
  birthday DATE,
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  delete_at TIMESTAMP,
  PRIMARY KEY (id)
);
-- Listamos las tablas:
SHOW TABLES;
-- Exploramos la estructura de la tabla:
DESC users;
-- Mostramos el DDL de la tabla:
SHOW CREATE TABLE users;
-- Listamos los indices de la tabla:
SHOW INDEXES FROM users;
-- Agregamos un indice:
ALTER TABLE users ADD UNIQUE user_id (user_id),
                  ADD UNIQUE email_un (email);

