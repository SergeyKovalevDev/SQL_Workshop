-- drop tables
DROP TABLE public.messages;
DROP TABLE public.passwords;
DROP TABLE public.users;

-- create tables
CREATE TABLE public.users (
	id serial4 NOT NULL,
	surname varchar(200) NOT NULL,
	firstname varchar(200) NOT NULL,
	email varchar(200) NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TRIGGER insert_users AFTER INSERT ON
public.users FOR EACH ROW EXECUTE FUNCTION insert_users();
CREATE TRIGGER delete_users BEFORE DELETE ON
public.users FOR EACH ROW EXECUTE FUNCTION delete_users();

CREATE TABLE public.passwords (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	passhash varchar(32) NULL DEFAULT NULL::character varying,
	CONSTRAINT passwords_pkey PRIMARY KEY (id),
	CONSTRAINT passwords_user_id_key UNIQUE (user_id),
	CONSTRAINT passwords_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id)
);

CREATE TABLE public.messages (
	id serial4 NOT NULL,
	sender_id int4 NOT NULL,
	recipient_id int4 NOT NULL,
	message text NULL,
	send_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	is_recived int4 NULL,
	is_delivered int4 NULL,
	CONSTRAINT messages_pkey PRIMARY KEY (id)--,
);

	 
