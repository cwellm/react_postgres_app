DROP FUNCTION IF EXISTS api.get_total_country_analytics_data;
CREATE OR REPLACE FUNCTION api.get_total_country_analytics_data()
    RETURNS TABLE (_name_ VARCHAR(255),_iso3_ CHAR(3),_cnt_ BIGINT)
    AS $$
    BEGIN
        RETURN QUERY
        SELECT name,iso3,COUNT(*) FROM country_codes a INNER JOIN user_stored_addresses b ON a.iso3 = b.country GROUP BY a.iso3,a.name;
        RETURN;
END;
    $$ LANGUAGE plpgsql
