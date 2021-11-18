DROP TABLE IF EXISTS items;

CREATE TABLE IF NOT EXISTS items (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  item_id CHAR(36) NOT NULL,
  item_status ENUM('Inactive','Active') DEFAULT 'Inactive' NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE items ADD UNIQUE item_id (item_id),
                  ADD INDEX title_id (title(100));

INSERT INTO items (item_id, item_status, title, description, price)
VALUES (UUID(), 'Active', 'iPhone 13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 900);

INSERT INTO items (item_id, item_status, title, description, price)
VALUES (UUID(), 'Active', 'OnePlus Nord CE', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.', 899.99);

INSERT INTO items (item_id, item_status, title, description, price)
VALUES (UUID(), 'Active', 'Samsung Galaxy M12', 'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus.', 439.9);

INSERT INTO items (item_id, item_status, title, description, price)
VALUES (UUID(), 'Active', 'IBM Thinkpad T41', 'Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.', 1400);
