SELECT * FROM users;

SELECT * FROM users\G

SELECT COUNT(*) FROM users;

SELECT user_id, email, username FROM users;

SELECT user_id, email, username FROM users WHERE user_status = 'Active';

SELECT user_id, email, username FROM users WHERE user_status = 'Active' AND email = 'juan_651@aol.es';

SELECT user_id, email, username, birthday, TIMESTAMPDIFF(YEAR, birthday, CURRENT_DATE) AS age FROM users WHERE user_status = 'Active';

SELECT username FROM users WHERE username LIKE 'P%';

SELECT DISTINCT SUBSTRING_INDEX(SUBSTR(email, INSTR(email, '@') + 1),'.',1) AS domains FROM users;

SELECT SUBSTRING_INDEX(SUBSTR(email, INSTR(email, '@') + 1),'.',1) AS domains, count(*) AS cnt
FROM users
GROUP BY domains
ORDER BY cnt DESC;
