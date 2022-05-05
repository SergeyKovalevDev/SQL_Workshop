CREATE TABLE users (
	id serial4 NOT NULL,
	nickname varchar(40) NOT NULL,
	firstname varchar(40) NOT NULL,
	surname varchar(40) NULL,
	email varchar(40) NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE passwords (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	passhash varchar(32) NOT NULL,
	CONSTRAINT passwords_pkey PRIMARY KEY (id),
	CONSTRAINT passwords_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id)
);

CREATE TABLE messages (
	id serial4 NOT NULL,
	sender_id int4 NOT NULL,
	recipient_id int4 NOT NULL,
	message text NULL,
	send_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	is_recived int4 NULL,
	is_delivered int4 NULL,
	CONSTRAINT messages_pkey PRIMARY KEY (id),
	CONSTRAINT messages_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users(id),
	CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id)
);
