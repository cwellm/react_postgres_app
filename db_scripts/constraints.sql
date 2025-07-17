DROP FUNCTION IF EXISTS api.form_validation_country_constraint;
CREATE OR REPLACE FUNCTION api.form_validation_country_constraint(text)
       RETURNS BOOLEAN
       AS $$
       DECLARE
       permitted_country_codes TEXT[];
       BEGIN
        SELECT ARRAY(
                   SELECT iso3::text FROM country_codes
        ) INTO permitted_country_codes;
        IF $1 = ANY(permitted_country_codes) THEN
           RETURN true;
        ELSE
            RETURN false;
        END IF;
       END;
       $$ LANGUAGE plpgsql
