INSERT INTO messages (sender_id, recipient_id, message, is_recived, is_delivered)
	VALUES (1, 2, 'hello world', 1, 1),
		   (1, 3, 'hi!', 1, 1),
		   (2, 1, 'good morning', 1, 1),
		   (4, 5, 'DO NOT disturb', 1, 1),
		   (5, 4, 'ok', 0, 0),
		   (6, 1, 'qwqe', 0, 1),
		   (3, 3, 'self', 1, 1);
		   
INSERT INTO messages (sender_id, recipient_id, message, is_recived, is_delivered)
	VALUES (2, 2, 'self2', 1, 1);

INSERT INTO messages (sender_id, recipient_id, message, is_recived, is_delivered)
	VALUES (2, 2, 'self3', 1, 1);
		  