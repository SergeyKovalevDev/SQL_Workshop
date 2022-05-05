/*CREATE TABLE users (
	id serial4 NOT NULL,
	nickname varchar(40) NOT NULL,
	firstname varchar(40) NOT NULL,
	surname varchar(40) NULL,
	email varchar(40) NOT NULL,
	create_date timestamp NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);*/

CREATE FUNCTION user_add() RETURNS trigger AS $user_add$
    BEGIN
        -- Проверка указния nickname
        IF NEW.namename IS NULL THEN
            RAISE EXCEPTION 'nickname cannot be null';
        END IF;
       
        -- Проверка указания firstname
        IF NEW.firstname IS NULL THEN
            RAISE EXCEPTION 'firstname cannot be null';
        END IF;

        -- Проверка указания email
        IF NEW.email IS NULL THEN
            RAISE EXCEPTION 'email cannot be null';
        END IF;
       
        -- Запомнить, кто и когда изменил запись
        NEW.create_date := current_timestamp;
       
        RETURN NEW;
    END;
$user_add$ LANGUAGE plpgsql;

CREATE TRIGGER user_add BEFORE INSERT ON users
    FOR EACH ROW EXECUTE FUNCTION user_add();
