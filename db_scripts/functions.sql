DROP FUNCTION IF EXISTS api.get_all_addresses;
CREATE OR REPLACE FUNCTION api.get_all_addresses()
       RETURNS SETOF public.user_stored_addresses
       AS $$
        BEGIN
        RETURN QUERY
            SELECT * FROM public.user_stored_addresses;
        IF NOT FOUND THEN
                RAISE EXCEPTION 'No addresses found.';
        END IF;
            RETURN;
        END;
       $$ LANGUAGE plpgsql
;

DROP FUNCTION IF EXISTS api.get_addresses_by_user_id;
CREATE OR REPLACE FUNCTION api.get_addresses_by_user_id(user_id INT)
       RETURNS SETOF public.user_stored_addresses
       AS $$
BEGIN
RETURN QUERY
SELECT * FROM public.user_stored_addresses WHERE public.user_stored_addresses.user_id = $1;
IF NOT FOUND THEN
                RAISE EXCEPTION 'No addresses found for id $1.';
END IF;
            RETURN;
END;
       $$ LANGUAGE plpgsql
;

DROP FUNCTION IF EXISTS api.add_address;
CREATE OR REPLACE FUNCTION api.add_address(JSON) RETURNS VOID
       AS $$
        DECLARE

       BEGIN
        INSERT INTO public.user_stored_addresses (user_id, first_name, last_name, street, house_number, postal_code, city,
                                                  country, email, telephone)
        VALUES (1, $1->>'firstName', $1->>'lastName', $1->>'street', ($1->>'houseNo')::int,
                $1->>'postalCode', $1->>'city', $1->>'country', $1->>'email', $1->>'telephone');
       END;
       $$ LANGUAGE plpgsql
;

DROP FUNCTION IF EXISTS api.delete_address;
CREATE OR REPLACE FUNCTION api.delete_address(JSON) RETURNS VOID
       AS $$
        DECLARE

       BEGIN
        DELETE FROM public.user_stored_addresses WHERE id = ($1->>'id')::bigint;
       END;
       $$ LANGUAGE plpgsql