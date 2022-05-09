-- ������, ������� ������� ���, �������, ��� ������
SELECT
	firstname AS "���",
	surname AS "�������",
	passhash AS "��� ������"
	FROM users
	LEFT JOIN passwords ON users.id = passwords.user_id;

-- ������, ������� ������� ������������� � ���������� email
SELECT
	firstname AS "���",
	surname AS "�������",
	email
	FROM users
	WHERE email IN (
		SELECT email
			FROM users
			GROUP BY email
			HAVING count(*)>1
	);

-- ������, ������� ������� ��� ������������ � ���������� ��������� ����������� ������������, ��������������� �� �������
SELECT message
	FROM messages
	WHERE recipient_id = 1 OR sender_id = 1
	ORDER BY send_date DESC;

-- ������ �������� �������������
SELECT sender_id
	FROM messages
	WHERE is_delivered IN (6, 8)
	GROUP BY sender_id
UNION 
SELECT recipient_id
	FROM messages
	WHERE is_delivered IN (7, 8)
	GROUP BY recipient_id;

-- ������ ���������, ������� ������������ �������� ��� ����
SELECT message AS "���������"
	FROM messages
	WHERE recipient_id = 2 AND sender_id = 2;










