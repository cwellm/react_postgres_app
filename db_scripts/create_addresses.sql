CREATE TABLE user_stored_addresses (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    user_id bigint references app_users(user_id) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street VARCHAR(60) NOT NULL,
    house_number INT NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    email VARCHAR(100),
    telephone VARCHAR(70)
);