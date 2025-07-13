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
;

DROP TYPE IF EXISTS letter_count;
CREATE TYPE letter_count AS (letter CHAR, cnt BIGINT);

DROP FUNCTION IF EXISTS get_name_letter_statistics_single_letter;
CREATE OR REPLACE FUNCTION get_name_letter_statistics_single_letter(CHAR)
       RETURNS letter_count
       AS $$
       DECLARE
letter_count_ letter_count;
        cnt_ BIGINT;
BEGIN
SELECT (SUM(CHAR_LENGTH(LOWER(first_name))-CHAR_LENGTH(REPLACE(LOWER(first_name),$1,''))) + SUM(CHAR_LENGTH(LOWER(last_name)) - CHAR_LENGTH(REPLACE(LOWER(last_name),$1,'')))) INTO cnt_ FROM user_stored_addresses;
letter_count_.letter := $1;
            letter_count_.cnt = cnt_;
RETURN letter_count_;
END;
       $$ LANGUAGE plpgsql
;

DROP FUNCTION IF EXISTS api.get_name_letter_statistics;
CREATE OR REPLACE FUNCTION api.get_name_letter_statistics()
    -- RETURNS TABLE (_first_split_ text[], _last_split_ text[])
    RETURNS SETOF letter_count
    AS $$
    DECLARE
arr_letters CHAR[] := ARRAY['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                                    'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
        letter_count_ letter_count;
        letter CHAR;

BEGIN
    FOREACH letter SLICE 0 IN ARRAY arr_letters LOOP
SELECT * INTO letter_count_ FROM public.get_name_letter_statistics_single_letter(letter);
RETURN NEXT letter_count_;
END LOOP;
    RETURN;
END;
        $$ LANGUAGE plpgsql
;

DROP FUNCTION IF EXISTS api.get_email_domain_count;
CREATE OR REPLACE FUNCTION api.get_email_domain_count()
       RETURNS TABLE(domains TEXT, cnt BIGINT)
       AS $$
BEGIN
RETURN QUERY
SELECT domains_, COUNT(domains_) FROM (SELECT (regexp_match(email, '.*[@](.*)'))[1] as domains_ FROM user_stored_addresses) GROUP BY domains_;
RETURN;
END;
       $$ LANGUAGE plpgsql
;

DROP FUNCTION IF EXISTS api.get_most_frequent_email_domain;
CREATE OR REPLACE FUNCTION api.get_most_frequent_email_domain()
       RETURNS SETOF TEXT
       AS $$
BEGIN
RETURN QUERY
SELECT domains from api.get_email_domain_count() WHERE cnt = (SELECT MAX(cnt) FROM api.get_email_domain_count());
RETURN;
END;
       $$ LANGUAGE plpgsql
;

DROP TYPE IF EXISTS postal_code_first_digit_count;
CREATE TYPE postal_code_first_digit_count AS (first_digit TEXT, cnt BIGINT);

DROP FUNCTION IF EXISTS api.get_most_frequent_first_digit_from_postal_code;
CREATE OR REPLACE FUNCTION api.get_most_frequent_first_digit_from_postal_code()
       RETURNS SETOF postal_code_first_digit_count
       AS $$
BEGIN
RETURN QUERY
    -- creating the table "first digit vs. frequency of occurrence"
    WITH digit_vs_occurrence AS (
        SELECT sub_, COUNT(sub_) as cnt_
        FROM (SELECT SUBSTRING(postal_code, 1, 1) as sub_ from user_stored_addresses)
        GROUP BY sub_
       )
SELECT sub_, cnt_ FROM digit_vs_occurrence WHERE
    cnt_ = (SELECT MAX(cnt_) FROM digit_vs_occurrence);
END;
       $$ LANGUAGE plpgsql
;
