CREATE TABLE public.user_stored_music (
     id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
     user_id bigint references app_users(user_id) NOT NULL,
     interpreter VARCHAR(100) NOT NULL,
     musical_piece_name VARCHAR(100) NOT NULL,
     music_link TEXT
);