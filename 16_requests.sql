-- Запрос, который выведет имя, фамилию, хэш пароля
SELECT
	firstname AS "Имя",
	surname AS "Фамилия",
	passhash AS "Хэш пароля"
	FROM users
	LEFT JOIN passwords ON users.id = passwords.user_id;

-- Запрос, который выведет пользователей с одинаковым email
SELECT
	firstname AS "Имя",
	surname AS "Фамилия",
	email
	FROM users
	WHERE email IN (
		SELECT email
			FROM users
			GROUP BY email
			HAVING count(*)>1
	);

-- Запрос, который выведет все отправленные и полученные сообщения конкретного пользователя, отсортированные по времени
SELECT message
	FROM messages
	WHERE recipient_id = 1 OR sender_id = 1
	ORDER BY send_date DESC;

-- Список удалённых пользователей
SELECT sender_id
	FROM messages
	WHERE is_delivered IN (6, 8)
	GROUP BY sender_id
UNION 
SELECT recipient_id
	FROM messages
	WHERE is_delivered IN (7, 8)
	GROUP BY recipient_id;

-- Список сообщений, которые пользователь отправил сам себе
SELECT message AS "Сообщение"
	FROM messages
	WHERE recipient_id = 2 AND sender_id = 2;










