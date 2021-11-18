INSERT INTO users (id, user_id, email, username, encrypted_password)
VALUES (
  1,
  UUID(),
  'fulano@domain.com',
  'fulano',
  'qweqwewq'
);

INSERT INTO users (id, user_id, email, username, encrypted_password)
VALUES (
  2,
  UUID(),
  'mengano@domain.com',
  'mengano',
  MD5('admin')
);
