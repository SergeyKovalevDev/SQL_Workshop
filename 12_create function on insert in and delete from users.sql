CREATE OR REPLACE FUNCTION insert_users() RETURNS TRIGGER AS $$
	BEGIN
		INSERT INTO passwords (user_id)
			VALUES (NEW.id);
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_users() RETURNS TRIGGER AS $$
	BEGIN
		DELETE FROM passwords
			WHERE user_id = OLD.id;
		-- Ќеочевидным альтернативным решением данной задачи €вл€етс€ смена статуса доставки сообщени€ 
		-- (также через триггер при удалении пользовател€). 
		-- —кажем, на 6 Ч удалЄн отправитель, 7 Ч удалЄн получатель, 8 Ч удалены оба.
		UPDATE messages
			SET is_delivered = 6
			WHERE sender_id = OLD.id AND (is_delivered = 0 OR is_delivered = 1);
		UPDATE messages
			SET is_delivered = 8
			WHERE sender_id = OLD.id AND is_delivered = 7;
		UPDATE messages
			SET is_delivered = 7
			WHERE recipient_id = OLD.id AND (is_delivered = 0 OR is_delivered = 1);
		UPDATE messages
			SET is_delivered = 8
			WHERE recipient_id = OLD.id AND is_delivered = 6;
		RETURN OLD;
	END;
$$ LANGUAGE plpgsql;
