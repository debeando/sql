SET @USERNAME = (SELECT CASE ROUND(RAND() * 11)
        WHEN 0 THEN "fulano"
        WHEN 1 THEN "mengano"
        WHEN 2 THEN "zutano"
        WHEN 3 THEN "jaimito"
        WHEN 4 THEN "maria"
        WHEN 5 THEN "jose"
        WHEN 6 THEN "carlos"
        WHEN 7 THEN "cristina"
        WHEN 8 THEN "pedro"
        WHEN 9 THEN "juan"
        ELSE "deleted"
      END);

INSERT INTO users (user_id, email, username, encrypted_password, user_status, birthday, delete_at)
SELECT
    UUID() AS user_id,
    CONCAT(
      @USERNAME,
      CASE ROUND(RAND() * 1)
        WHEN 0 THEN ""
        WHEN 1 THEN "_"
      END,
      ROUND(RAND() * 1000),
      "@",
      CASE ROUND(RAND() * 6)
        WHEN 0 THEN "hotmail.es"
        WHEN 1 THEN "gmail.es"
        WHEN 2 THEN "gmail.com"
        WHEN 3 THEN "icloud.com"
        WHEN 4 THEN "me.com"
        WHEN 5 THEN "aol.es"
        WHEN 6 THEN "aol.com"
      END
    ) AS email,
    CONCAT(UCASE(LEFT(@USERNAME, 1)),SUBSTRING(@USERNAME, 2)) AS username,
    CASE WHEN @USERNAME != "deleted" THEN SHA1(UUID())
         WHEN @USERNAME  = "deleted" THEN SHA1("empty")
    END AS encrypted_password,
    CASE WHEN @USERNAME != "deleted" THEN "Active"
         WHEN @USERNAME  = "deleted" THEN "Inactive"
    END AS user_status,
    CASE ROUND(RAND() * 1)
      WHEN 0 THEN NULL
      WHEN 1 THEN CAST(FROM_UNIXTIME(UNIX_TIMESTAMP('1980-01-01 01:00:00') + FLOOR(RAND()*31536000)) AS DATE)
    END AS birthday,
    CASE WHEN @USERNAME != "deleted" THEN NULL
         WHEN @USERNAME  = "deleted" THEN CAST(FROM_UNIXTIME(UNIX_TIMESTAMP('2020-01-01 01:00:00') + FLOOR(RAND()*31536000)) AS DATETIME)
    END AS delete_at
;
