DROP FUNCTION IF EXISTS api.get_total_country_analytics_data;
CREATE OR REPLACE FUNCTION api.get_total_country_analytics_data()

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
