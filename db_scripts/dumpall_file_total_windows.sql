--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE IF EXISTS cwdat;
DROP DATABASE IF EXISTS mydb01;
DROP DATABASE IF EXISTS react_app;
DROP DATABASE IF EXISTS testdb;




--
-- Drop roles
--

DROP ROLE IF EXISTS christoph;
DROP ROLE IF EXISTS foo;
DROP ROLE IF EXISTS postgres;
DROP ROLE IF EXISTS react_robot;


--
-- Roles
--

CREATE ROLE christoph;
ALTER ROLE christoph WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:DaLFc5jub49AmsuPMdcuZQ==$4Kn64i1BFHvSQzJ/KA40bF2LcbUTdF9oqsjxT9enYh4=:LrTy4mY4nBDsNivfIpQ2/TgwQYJYDUzrFYmb5//Z7OQ=';
CREATE ROLE foo;
ALTER ROLE foo WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:6OMpne8RuuhsqBVOwRRmag==$+aAjq5yvZwXRbDNsk1AwYR8c6L63yEaXqM5VP/NUlsQ=:xRf39/mZQOBDdl/+m6DlOyGj3LlPMpEYKfOjPnTKcMs=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:f9tSnZtRBdoHGnJsdA5MIA==$yHmYY+51e9JAEWltJnzPW5BKSk+qcERmd1U87/FPdNg=:cy7NQcitiTsTlIhtDuZKeujGC6m+l3dNP9yWmlw+KDI=';
CREATE ROLE react_robot;
ALTER ROLE react_robot WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:/qm6CXcB7rmYyS1dZdgaEg==$sYhRj3ER2BeeK0ioXZ5Klfknd4Au/LqE98foEUGxq+4=:d03gam3h+QXmbfuLackLchAgqo/Bq17wKb76iMzD6zw=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "cwdat" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: cwdat; Type: DATABASE; Schema: -; Owner: christoph
--

CREATE DATABASE cwdat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'de_DE.UTF-8';


ALTER DATABASE cwdat OWNER TO christoph;

\connect cwdat

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cwdiary; Type: TABLE; Schema: public; Owner: christoph
--

CREATE TABLE public.cwdiary (
    date date,
    cash money
);


ALTER TABLE public.cwdiary OWNER TO christoph;

--
-- Data for Name: cwdiary; Type: TABLE DATA; Schema: public; Owner: christoph
--

COPY public.cwdiary (date, cash) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

--
-- Database "mydb01" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mydb01; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mydb01 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'de_DE.UTF-8';


ALTER DATABASE mydb01 OWNER TO postgres;

\connect mydb01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "react_app" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: react_app; Type: DATABASE; Schema: -; Owner: react_robot
--

CREATE DATABASE react_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE react_app OWNER TO react_robot;

\connect react_app

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: api; Type: SCHEMA; Schema: -; Owner: react_robot
--

CREATE SCHEMA api;


ALTER SCHEMA api OWNER TO react_robot;

--
-- Name: react_app; Type: SCHEMA; Schema: -; Owner: react_robot
--

CREATE SCHEMA react_app;


ALTER SCHEMA react_app OWNER TO react_robot;

--
-- Name: react_robot; Type: SCHEMA; Schema: -; Owner: react_robot
--

CREATE SCHEMA react_robot;


ALTER SCHEMA react_robot OWNER TO react_robot;

--
-- Name: testing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA testing;


ALTER SCHEMA testing OWNER TO postgres;

--
-- Name: has_at(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.has_at(t text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
DECLARE
	pos INT;
BEGIN
  IF position('@' in $1) > 0 THEN
  	RETURN TRUE;
  ELSE
  	RETURN FALSE;
  END IF;
END;
$_$;


ALTER FUNCTION public.has_at(t text) OWNER TO postgres;

--
-- Name: common_email_checks; Type: DOMAIN; Schema: public; Owner: react_robot
--

CREATE DOMAIN public.common_email_checks AS text
	CONSTRAINT email_at CHECK (public.has_at(VALUE));


ALTER DOMAIN public.common_email_checks OWNER TO react_robot;

--
-- Name: letter_count; Type: TYPE; Schema: public; Owner: react_robot
--

CREATE TYPE public.letter_count AS (
	letter character(1),
	cnt bigint
);


ALTER TYPE public.letter_count OWNER TO react_robot;

--
-- Name: postal_code_first_digit_count; Type: TYPE; Schema: public; Owner: react_robot
--

CREATE TYPE public.postal_code_first_digit_count AS (
	first_digit text,
	cnt bigint
);


ALTER TYPE public.postal_code_first_digit_count OWNER TO react_robot;

--
-- Name: add_address(json); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.add_address(json) RETURNS void
    LANGUAGE plpgsql
    AS $_$
        DECLARE

       BEGIN
        INSERT INTO public.user_stored_addresses (user_id, first_name, last_name, street, house_number, postal_code, city,
                                                  country, email, telephone)
        VALUES (1, $1->>'firstName', $1->>'lastName', $1->>'street', ($1->>'houseNo')::int,
                $1->>'postalCode', $1->>'city', $1->>'country', $1->>'email', $1->>'telephone');
       END;
       $_$;


ALTER FUNCTION api.add_address(json) OWNER TO react_robot;

--
-- Name: add_music(json); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.add_music(json) RETURNS void
    LANGUAGE plpgsql
    AS $_$
        DECLARE

BEGIN
INSERT INTO public.user_stored_music (user_id, interpreter, musical_piece_name, music_link)
VALUES (1, $1->>'interpreter', $1->>'musical_piece_name', $1->>'music_link');
END;
       $_$;


ALTER FUNCTION api.add_music(json) OWNER TO react_robot;

--
-- Name: delete_address(json); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.delete_address(json) RETURNS void
    LANGUAGE plpgsql
    AS $_$
        DECLARE

       BEGIN
        DELETE FROM public.user_stored_addresses WHERE id = ($1->>'id')::bigint;
       END;
       $_$;


ALTER FUNCTION api.delete_address(json) OWNER TO react_robot;

--
-- Name: delete_music(json); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.delete_music(json) RETURNS void
    LANGUAGE plpgsql
    AS $_$
        DECLARE

BEGIN
DELETE FROM public.user_stored_music WHERE id = ($1->>'id')::bigint;
END;
       $_$;


ALTER FUNCTION api.delete_music(json) OWNER TO react_robot;

--
-- Name: form_validation_country_constraint(text); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.form_validation_country_constraint(text) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
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
       $_$;


ALTER FUNCTION api.form_validation_country_constraint(text) OWNER TO react_robot;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user_stored_addresses; Type: TABLE; Schema: public; Owner: react_robot
--

CREATE TABLE public.user_stored_addresses (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    street character varying(60) NOT NULL,
    house_number integer NOT NULL,
    postal_code character varying(10) NOT NULL,
    city character varying(50) NOT NULL,
    country character varying(50),
    email character varying(100),
    telephone character varying(70)
);


ALTER TABLE public.user_stored_addresses OWNER TO react_robot;

--
-- Name: get_addresses_by_user_id(integer); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_addresses_by_user_id(user_id integer) RETURNS SETOF public.user_stored_addresses
    LANGUAGE plpgsql
    AS $_$
BEGIN
RETURN QUERY
SELECT * FROM public.user_stored_addresses WHERE public.user_stored_addresses.user_id = $1;
IF NOT FOUND THEN
                RAISE EXCEPTION 'No addresses found for id $1.';
END IF;
            RETURN;
END;
       $_$;


ALTER FUNCTION api.get_addresses_by_user_id(user_id integer) OWNER TO react_robot;

--
-- Name: get_all_addresses(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_all_addresses() RETURNS SETOF public.user_stored_addresses
    LANGUAGE plpgsql
    AS $$
        BEGIN
        RETURN QUERY
            SELECT * FROM public.user_stored_addresses;
        IF NOT FOUND THEN
                RAISE EXCEPTION 'No addresses found.';
        END IF;
            RETURN;
        END;
       $$;


ALTER FUNCTION api.get_all_addresses() OWNER TO react_robot;

--
-- Name: get_all_country_codes_iso3(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_all_country_codes_iso3() RETURNS SETOF character
    LANGUAGE plpgsql
    AS $$
       BEGIN
       RETURN QUERY
        SELECT iso3 FROM public.country_codes;
        IF NOT FOUND THEN
           RAISE EXCEPTION 'No countries found';
        END IF;
           RETURN;
       END;
       $$;


ALTER FUNCTION api.get_all_country_codes_iso3() OWNER TO react_robot;

--
-- Name: user_stored_music; Type: TABLE; Schema: public; Owner: react_robot
--

CREATE TABLE public.user_stored_music (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    interpreter character varying(100) NOT NULL,
    musical_piece_name character varying(100) NOT NULL,
    music_link text
);


ALTER TABLE public.user_stored_music OWNER TO react_robot;

--
-- Name: get_all_music(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_all_music() RETURNS SETOF public.user_stored_music
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
SELECT * FROM public.user_stored_music;
IF NOT FOUND THEN
                RAISE EXCEPTION 'No music found.';
END IF;
            RETURN;
END;
       $$;


ALTER FUNCTION api.get_all_music() OWNER TO react_robot;

--
-- Name: get_email_domain_count(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_email_domain_count() RETURNS TABLE(domains text, cnt bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
SELECT domains_, COUNT(domains_) FROM (SELECT (regexp_match(email, '.*[@](.*)'))[1] as domains_ FROM user_stored_addresses) as domain_sub GROUP BY domains_;
RETURN;
END;
       $$;


ALTER FUNCTION api.get_email_domain_count() OWNER TO react_robot;

--
-- Name: get_most_frequent_email_domain(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_most_frequent_email_domain() RETURNS SETOF text
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
SELECT domains from api.get_email_domain_count() WHERE cnt = (SELECT MAX(cnt) as max_cnt FROM api.get_email_domain_count());
RETURN;
END;
       $$;


ALTER FUNCTION api.get_most_frequent_email_domain() OWNER TO react_robot;

--
-- Name: get_most_frequent_first_digit_from_postal_code(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_most_frequent_first_digit_from_postal_code() RETURNS SETOF public.postal_code_first_digit_count
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
    -- creating the table "first digit vs. frequency of occurrence"
    WITH digit_vs_occurrence AS (
        SELECT sub_, COUNT(sub_) as cnt_
        FROM (SELECT SUBSTRING(postal_code, 1, 1) as sub_ from user_stored_addresses) as sub_sub
        GROUP BY sub_
       )
SELECT sub_, cnt_ FROM digit_vs_occurrence WHERE
    cnt_ = (SELECT MAX(cnt_) FROM digit_vs_occurrence);
END;
       $$;


ALTER FUNCTION api.get_most_frequent_first_digit_from_postal_code() OWNER TO react_robot;

--
-- Name: get_music_by_user_id(integer); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_music_by_user_id(user_id integer) RETURNS SETOF public.user_stored_music
    LANGUAGE plpgsql
    AS $_$
BEGIN
RETURN QUERY
SELECT * FROM public.user_stored_music WHERE public.user_stored_music.user_id = $1;
IF NOT FOUND THEN
                RAISE EXCEPTION 'No music found for id $1.';
END IF;
            RETURN;
END;
       $_$;


ALTER FUNCTION api.get_music_by_user_id(user_id integer) OWNER TO react_robot;

--
-- Name: get_name_letter_statistics(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_name_letter_statistics() RETURNS SETOF public.letter_count
    LANGUAGE plpgsql
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
        $$;


ALTER FUNCTION api.get_name_letter_statistics() OWNER TO react_robot;

--
-- Name: get_total_country_analytics_data(); Type: FUNCTION; Schema: api; Owner: react_robot
--

CREATE FUNCTION api.get_total_country_analytics_data() RETURNS TABLE(_name_ character varying, _iso3_ character, _cnt_ bigint)
    LANGUAGE plpgsql
    AS $$
    BEGIN
        RETURN QUERY
        SELECT name,iso3,COUNT(*) FROM country_codes a INNER JOIN user_stored_addresses b ON a.iso3 = b.country GROUP BY a.iso3,a.name;
        RETURN;
END;
    $$;


ALTER FUNCTION api.get_total_country_analytics_data() OWNER TO react_robot;

--
-- Name: get_name_letter_statistics_single_letter(character); Type: FUNCTION; Schema: public; Owner: react_robot
--

CREATE FUNCTION public.get_name_letter_statistics_single_letter(character) RETURNS public.letter_count
    LANGUAGE plpgsql
    AS $_$
       DECLARE
letter_count_ letter_count;
        cnt_ BIGINT;
BEGIN
SELECT (SUM(CHAR_LENGTH(LOWER(first_name))-CHAR_LENGTH(REPLACE(LOWER(first_name),$1,''))) + SUM(CHAR_LENGTH(LOWER(last_name)) - CHAR_LENGTH(REPLACE(LOWER(last_name),$1,'')))) INTO cnt_ FROM user_stored_addresses;
letter_count_.letter := $1;
            letter_count_.cnt = cnt_;
RETURN letter_count_;
END;
       $_$;


ALTER FUNCTION public.get_name_letter_statistics_single_letter(character) OWNER TO react_robot;

--
-- Name: app_users; Type: TABLE; Schema: public; Owner: react_robot
--

CREATE TABLE public.app_users (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    password_md5 character(32),
    CONSTRAINT valid_md5 CHECK ((password_md5 ~ '^[a-f0-9]{32}$'::text))
);


ALTER TABLE public.app_users OWNER TO react_robot;

--
-- Name: app_users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: react_robot
--

ALTER TABLE public.app_users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.app_users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: continent_codes; Type: TABLE; Schema: public; Owner: react_robot
--

CREATE TABLE public.continent_codes (
    code character(2) NOT NULL,
    name character varying(255)
);


ALTER TABLE public.continent_codes OWNER TO react_robot;

--
-- Name: country_codes; Type: TABLE; Schema: public; Owner: react_robot
--

CREATE TABLE public.country_codes (
    code character(2) NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    iso3 character(3) NOT NULL,
    number character(3) NOT NULL,
    continent_code character(2) NOT NULL
);


ALTER TABLE public.country_codes OWNER TO react_robot;

--
-- Name: user_stored_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: react_robot
--

ALTER TABLE public.user_stored_addresses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_stored_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_stored_music_id_seq; Type: SEQUENCE; Schema: public; Owner: react_robot
--

ALTER TABLE public.user_stored_music ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_stored_music_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: foo; Type: TABLE; Schema: react_app; Owner: react_robot
--

CREATE TABLE react_app.foo (
);


ALTER TABLE react_app.foo OWNER TO react_robot;

--
-- Name: email_at; Type: TABLE; Schema: testing; Owner: postgres
--

CREATE TABLE testing.email_at (
    id integer,
    email public.common_email_checks
);


ALTER TABLE testing.email_at OWNER TO postgres;

--
-- Data for Name: app_users; Type: TABLE DATA; Schema: public; Owner: react_robot
--

COPY public.app_users (user_id, username, password_md5) FROM stdin;
1	test_user	16ec1ebb01fe02ded9b7d5447d3dfc65
4	Maria Möchtegern	e254b14406bbe52762363b4ff131a6c7
\.


--
-- Data for Name: continent_codes; Type: TABLE DATA; Schema: public; Owner: react_robot
--

COPY public.continent_codes (code, name) FROM stdin;
AF	Africa
AS	Asia
EU	Europe
NA	North America
SA	South America
OC	Oceania
AN	Antarctica
\.


--
-- Data for Name: country_codes; Type: TABLE DATA; Schema: public; Owner: react_robot
--

COPY public.country_codes (code, name, full_name, iso3, number, continent_code) FROM stdin;
AF	Afghanistan	Islamic Republic of Afghanistan	AFG	004	AS
AX	Åland Islands	Åland Islands	ALA	248	EU
AL	Albania	Republic of Albania	ALB	008	EU
DZ	Algeria	People's Democratic Republic of Algeria	DZA	012	AF
AS	American Samoa	American Samoa	ASM	016	OC
AD	Andorra	Principality of Andorra	AND	020	EU
AO	Angola	Republic of Angola	AGO	024	AF
AI	Anguilla	Anguilla	AIA	660	NA
AQ	Antarctica	Antarctica (the territory South of 60 deg S)	ATA	010	AN
AG	Antigua and Barbuda	Antigua and Barbuda	ATG	028	NA
AR	Argentina	Argentine Republic	ARG	032	SA
AM	Armenia	Republic of Armenia	ARM	051	AS
AW	Aruba	Aruba	ABW	533	NA
AU	Australia	Commonwealth of Australia	AUS	036	OC
AT	Austria	Republic of Austria	AUT	040	EU
AZ	Azerbaijan	Republic of Azerbaijan	AZE	031	AS
BS	Bahamas	Commonwealth of the Bahamas	BHS	044	NA
BH	Bahrain	Kingdom of Bahrain	BHR	048	AS
BD	Bangladesh	People's Republic of Bangladesh	BGD	050	AS
BB	Barbados	Barbados	BRB	052	NA
BY	Belarus	Republic of Belarus	BLR	112	EU
BE	Belgium	Kingdom of Belgium	BEL	056	EU
BZ	Belize	Belize	BLZ	084	NA
BJ	Benin	Republic of Benin	BEN	204	AF
BM	Bermuda	Bermuda	BMU	060	NA
BT	Bhutan	Kingdom of Bhutan	BTN	064	AS
BO	Bolivia	Plurinational State of Bolivia	BOL	068	SA
BQ	Bonaire, Sint Eustatius and Saba	Bonaire, Sint Eustatius and Saba	BES	535	NA
BA	Bosnia and Herzegovina	Bosnia and Herzegovina	BIH	070	EU
BW	Botswana	Republic of Botswana	BWA	072	AF
BV	Bouvet Island (Bouvetøya)	Bouvet Island (Bouvetøya)	BVT	074	AN
BR	Brazil	Federative Republic of Brazil	BRA	076	SA
IO	British Indian Ocean Territory (Chagos Archipelago)	British Indian Ocean Territory (Chagos Archipelago)	IOT	086	AS
VG	British Virgin Islands	British Virgin Islands	VGB	092	NA
BN	Brunei Darussalam	Brunei Darussalam	BRN	096	AS
BG	Bulgaria	Republic of Bulgaria	BGR	100	EU
BF	Burkina Faso	Burkina Faso	BFA	854	AF
BI	Burundi	Republic of Burundi	BDI	108	AF
KH	Cambodia	Kingdom of Cambodia	KHM	116	AS
CM	Cameroon	Republic of Cameroon	CMR	120	AF
CA	Canada	Canada	CAN	124	NA
CV	Cabo Verde	Republic of Cabo Verde	CPV	132	AF
KY	Cayman Islands	Cayman Islands	CYM	136	NA
CF	Central African Republic	Central African Republic	CAF	140	AF
TD	Chad	Republic of Chad	TCD	148	AF
CL	Chile	Republic of Chile	CHL	152	SA
CN	China	People's Republic of China	CHN	156	AS
CX	Christmas Island	Christmas Island	CXR	162	AS
CC	Cocos (Keeling) Islands	Cocos (Keeling) Islands	CCK	166	AS
CO	Colombia	Republic of Colombia	COL	170	SA
KM	Comoros	Union of the Comoros	COM	174	AF
CD	Congo	Democratic Republic of the Congo	COD	180	AF
CG	Congo	Republic of the Congo	COG	178	AF
CK	Cook Islands	Cook Islands	COK	184	OC
CR	Costa Rica	Republic of Costa Rica	CRI	188	NA
CI	Cote d'Ivoire	Republic of Cote d'Ivoire	CIV	384	AF
HR	Croatia	Republic of Croatia	HRV	191	EU
CU	Cuba	Republic of Cuba	CUB	192	NA
CW	Curaçao	Curaçao	CUW	531	NA
CY	Cyprus	Republic of Cyprus	CYP	196	AS
CZ	Czechia	Czech Republic	CZE	203	EU
DK	Denmark	Kingdom of Denmark	DNK	208	EU
DJ	Djibouti	Republic of Djibouti	DJI	262	AF
DM	Dominica	Commonwealth of Dominica	DMA	212	NA
DO	Dominican Republic	Dominican Republic	DOM	214	NA
EC	Ecuador	Republic of Ecuador	ECU	218	SA
EG	Egypt	Arab Republic of Egypt	EGY	818	AF
SV	El Salvador	Republic of El Salvador	SLV	222	NA
GQ	Equatorial Guinea	Republic of Equatorial Guinea	GNQ	226	AF
ER	Eritrea	State of Eritrea	ERI	232	AF
EE	Estonia	Republic of Estonia	EST	233	EU
ET	Ethiopia	Federal Democratic Republic of Ethiopia	ETH	231	AF
FO	Faroe Islands	Faroe Islands	FRO	234	EU
FK	Falkland Islands (Malvinas)	Falkland Islands (Malvinas)	FLK	238	SA
FJ	Fiji	Republic of Fiji	FJI	242	OC
FI	Finland	Republic of Finland	FIN	246	EU
FR	France	French Republic	FRA	250	EU
GF	French Guiana	French Guiana	GUF	254	SA
PF	French Polynesia	French Polynesia	PYF	258	OC
TF	French Southern Territories	French Southern Territories	ATF	260	AN
GA	Gabon	Gabonese Republic	GAB	266	AF
GM	Gambia	Republic of the Gambia	GMB	270	AF
GE	Georgia	Georgia	GEO	268	AS
DE	Germany	Federal Republic of Germany	DEU	276	EU
GH	Ghana	Republic of Ghana	GHA	288	AF
GI	Gibraltar	Gibraltar	GIB	292	EU
GR	Greece	Hellenic Republic of Greece	GRC	300	EU
GL	Greenland	Greenland	GRL	304	NA
GD	Grenada	Grenada	GRD	308	NA
GP	Guadeloupe	Guadeloupe	GLP	312	NA
GU	Guam	Guam	GUM	316	OC
GT	Guatemala	Republic of Guatemala	GTM	320	NA
GG	Guernsey	Bailiwick of Guernsey	GGY	831	EU
GN	Guinea	Republic of Guinea	GIN	324	AF
GW	Guinea-Bissau	Republic of Guinea-Bissau	GNB	624	AF
GY	Guyana	Co-operative Republic of Guyana	GUY	328	SA
HT	Haiti	Republic of Haiti	HTI	332	NA
HM	Heard Island and McDonald Islands	Heard Island and McDonald Islands	HMD	334	AN
VA	Holy See (Vatican City State)	Holy See (Vatican City State)	VAT	336	EU
HN	Honduras	Republic of Honduras	HND	340	NA
HK	Hong Kong	Hong Kong Special Administrative Region of China	HKG	344	AS
HU	Hungary	Hungary	HUN	348	EU
IS	Iceland	Iceland	ISL	352	EU
IN	India	Republic of India	IND	356	AS
ID	Indonesia	Republic of Indonesia	IDN	360	AS
IR	Iran	Islamic Republic of Iran	IRN	364	AS
IQ	Iraq	Republic of Iraq	IRQ	368	AS
IE	Ireland	Ireland	IRL	372	EU
IM	Isle of Man	Isle of Man	IMN	833	EU
IL	Israel	State of Israel	ISR	376	AS
IT	Italy	Republic of Italy	ITA	380	EU
JM	Jamaica	Jamaica	JAM	388	NA
JP	Japan	Japan	JPN	392	AS
JE	Jersey	Bailiwick of Jersey	JEY	832	EU
JO	Jordan	Hashemite Kingdom of Jordan	JOR	400	AS
KZ	Kazakhstan	Republic of Kazakhstan	KAZ	398	AS
KE	Kenya	Republic of Kenya	KEN	404	AF
KI	Kiribati	Republic of Kiribati	KIR	296	OC
KP	Korea	Democratic People's Republic of Korea	PRK	408	AS
KR	Korea	Republic of Korea	KOR	410	AS
KW	Kuwait	State of Kuwait	KWT	414	AS
KG	Kyrgyz Republic	Kyrgyz Republic	KGZ	417	AS
LA	Lao People's Democratic Republic	Lao People's Democratic Republic	LAO	418	AS
LV	Latvia	Republic of Latvia	LVA	428	EU
LB	Lebanon	Lebanese Republic	LBN	422	AS
LS	Lesotho	Kingdom of Lesotho	LSO	426	AF
LR	Liberia	Republic of Liberia	LBR	430	AF
LY	Libya	State of Libya	LBY	434	AF
LI	Liechtenstein	Principality of Liechtenstein	LIE	438	EU
LT	Lithuania	Republic of Lithuania	LTU	440	EU
LU	Luxembourg	Grand Duchy of Luxembourg	LUX	442	EU
MO	Macao	Macao Special Administrative Region of China	MAC	446	AS
MG	Madagascar	Republic of Madagascar	MDG	450	AF
MW	Malawi	Republic of Malawi	MWI	454	AF
MY	Malaysia	Malaysia	MYS	458	AS
MV	Maldives	Republic of Maldives	MDV	462	AS
ML	Mali	Republic of Mali	MLI	466	AF
MT	Malta	Republic of Malta	MLT	470	EU
MH	Marshall Islands	Republic of the Marshall Islands	MHL	584	OC
MQ	Martinique	Martinique	MTQ	474	NA
MR	Mauritania	Islamic Republic of Mauritania	MRT	478	AF
MU	Mauritius	Republic of Mauritius	MUS	480	AF
YT	Mayotte	Mayotte	MYT	175	AF
MX	Mexico	United Mexican States	MEX	484	NA
FM	Micronesia	Federated States of Micronesia	FSM	583	OC
MD	Moldova	Republic of Moldova	MDA	498	EU
MC	Monaco	Principality of Monaco	MCO	492	EU
MN	Mongolia	Mongolia	MNG	496	AS
ME	Montenegro	Montenegro	MNE	499	EU
MS	Montserrat	Montserrat	MSR	500	NA
MA	Morocco	Kingdom of Morocco	MAR	504	AF
MZ	Mozambique	Republic of Mozambique	MOZ	508	AF
MM	Myanmar	Republic of the Union of Myanmar	MMR	104	AS
NA	Namibia	Republic of Namibia	NAM	516	AF
NR	Nauru	Republic of Nauru	NRU	520	OC
NP	Nepal	Nepal	NPL	524	AS
NL	Netherlands	Kingdom of the Netherlands	NLD	528	EU
NC	New Caledonia	New Caledonia	NCL	540	OC
NZ	New Zealand	New Zealand	NZL	554	OC
NI	Nicaragua	Republic of Nicaragua	NIC	558	NA
NE	Niger	Republic of Niger	NER	562	AF
NG	Nigeria	Federal Republic of Nigeria	NGA	566	AF
NU	Niue	Niue	NIU	570	OC
NF	Norfolk Island	Norfolk Island	NFK	574	OC
MK	North Macedonia	Republic of North Macedonia	MKD	807	EU
MP	Northern Mariana Islands	Commonwealth of the Northern Mariana Islands	MNP	580	OC
NO	Norway	Kingdom of Norway	NOR	578	EU
OM	Oman	Sultanate of Oman	OMN	512	AS
PK	Pakistan	Islamic Republic of Pakistan	PAK	586	AS
PW	Palau	Republic of Palau	PLW	585	OC
PS	Palestine	State of Palestine	PSE	275	AS
PA	Panama	Republic of Panama	PAN	591	NA
PG	Papua New Guinea	Independent State of Papua New Guinea	PNG	598	OC
PY	Paraguay	Republic of Paraguay	PRY	600	SA
PE	Peru	Republic of Peru	PER	604	SA
PH	Philippines	Republic of the Philippines	PHL	608	AS
PN	Pitcairn Islands	Pitcairn Islands	PCN	612	OC
PL	Poland	Republic of Poland	POL	616	EU
PT	Portugal	Portuguese Republic	PRT	620	EU
PR	Puerto Rico	Commonwealth of Puerto Rico	PRI	630	NA
QA	Qatar	State of Qatar	QAT	634	AS
RE	Réunion	Réunion	REU	638	AF
RO	Romania	Romania	ROU	642	EU
RU	Russian Federation	Russian Federation	RUS	643	EU
RW	Rwanda	Republic of Rwanda	RWA	646	AF
BL	Saint Barthélemy	Saint Barthélemy	BLM	652	NA
SH	Saint Helena, Ascension and Tristan da Cunha	Saint Helena, Ascension and Tristan da Cunha	SHN	654	AF
KN	Saint Kitts and Nevis	Federation of Saint Kitts and Nevis	KNA	659	NA
LC	Saint Lucia	Saint Lucia	LCA	662	NA
MF	Saint Martin	Saint Martin (French part)	MAF	663	NA
PM	Saint Pierre and Miquelon	Saint Pierre and Miquelon	SPM	666	NA
VC	Saint Vincent and the Grenadines	Saint Vincent and the Grenadines	VCT	670	NA
WS	Samoa	Independent State of Samoa	WSM	882	OC
SM	San Marino	Republic of San Marino	SMR	674	EU
ST	Sao Tome and Principe	Democratic Republic of Sao Tome and Principe	STP	678	AF
SA	Saudi Arabia	Kingdom of Saudi Arabia	SAU	682	AS
SN	Senegal	Republic of Senegal	SEN	686	AF
RS	Serbia	Republic of Serbia	SRB	688	EU
SC	Seychelles	Republic of Seychelles	SYC	690	AF
SL	Sierra Leone	Republic of Sierra Leone	SLE	694	AF
SG	Singapore	Republic of Singapore	SGP	702	AS
SX	Sint Maarten (Dutch part)	Sint Maarten (Dutch part)	SXM	534	NA
SK	Slovakia (Slovak Republic)	Slovakia (Slovak Republic)	SVK	703	EU
SI	Slovenia	Republic of Slovenia	SVN	705	EU
SB	Solomon Islands	Solomon Islands	SLB	090	OC
SO	Somalia	Federal Republic of Somalia	SOM	706	AF
ZA	South Africa	Republic of South Africa	ZAF	710	AF
GS	South Georgia and the South Sandwich Islands	South Georgia and the South Sandwich Islands	SGS	239	AN
SS	South Sudan	Republic of South Sudan	SSD	728	AF
ES	Spain	Kingdom of Spain	ESP	724	EU
LK	Sri Lanka	Democratic Socialist Republic of Sri Lanka	LKA	144	AS
SD	Sudan	Republic of Sudan	SDN	729	AF
SR	Suriname	Republic of Suriname	SUR	740	SA
SJ	Svalbard & Jan Mayen Islands	Svalbard & Jan Mayen Islands	SJM	744	EU
SZ	Eswatini	Kingdom of Eswatini	SWZ	748	AF
SE	Sweden	Kingdom of Sweden	SWE	752	EU
CH	Switzerland	Swiss Confederation	CHE	756	EU
SY	Syrian Arab Republic	Syrian Arab Republic	SYR	760	AS
TW	Taiwan	Taiwan, Province of China	TWN	158	AS
TJ	Tajikistan	Republic of Tajikistan	TJK	762	AS
TZ	Tanzania	United Republic of Tanzania	TZA	834	AF
TH	Thailand	Kingdom of Thailand	THA	764	AS
TL	Timor-Leste	Democratic Republic of Timor-Leste	TLS	626	AS
TG	Togo	Togolese Republic	TGO	768	AF
TK	Tokelau	Tokelau	TKL	772	OC
TO	Tonga	Kingdom of Tonga	TON	776	OC
TT	Trinidad and Tobago	Republic of Trinidad and Tobago	TTO	780	NA
TN	Tunisia	Tunisian Republic	TUN	788	AF
TR	Türkiye	Republic of Türkiye	TUR	792	AS
TM	Turkmenistan	Turkmenistan	TKM	795	AS
TC	Turks and Caicos Islands	Turks and Caicos Islands	TCA	796	NA
TV	Tuvalu	Tuvalu	TUV	798	OC
UG	Uganda	Republic of Uganda	UGA	800	AF
UA	Ukraine	Ukraine	UKR	804	EU
AE	United Arab Emirates	United Arab Emirates	ARE	784	AS
GB	United Kingdom of Great Britain and Northern Ireland	United Kingdom of Great Britain & Northern Ireland	GBR	826	EU
US	United States of America	United States of America	USA	840	NA
UM	United States Minor Outlying Islands	United States Minor Outlying Islands	UMI	581	OC
VI	United States Virgin Islands	United States Virgin Islands	VIR	850	NA
UY	Uruguay	Eastern Republic of Uruguay	URY	858	SA
UZ	Uzbekistan	Republic of Uzbekistan	UZB	860	AS
VU	Vanuatu	Republic of Vanuatu	VUT	548	OC
VE	Venezuela	Bolivarian Republic of Venezuela	VEN	862	SA
VN	Vietnam	Socialist Republic of Vietnam	VNM	704	AS
WF	Wallis and Futuna	Wallis and Futuna	WLF	876	OC
EH	Western Sahara	Western Sahara	ESH	732	AF
YE	Yemen	Yemen	YEM	887	AS
ZM	Zambia	Republic of Zambia	ZMB	894	AF
ZW	Zimbabwe	Republic of Zimbabwe	ZWE	716	AF
\.


--
-- Data for Name: user_stored_addresses; Type: TABLE DATA; Schema: public; Owner: react_robot
--

COPY public.user_stored_addresses (id, user_id, first_name, last_name, street, house_number, postal_code, city, country, email, telephone) FROM stdin;
14	1	Levi	Strauss	Friedrich Foerster Strasse	66	67839	Goettingen	DEU	levi.strauss@gmx.de	
15	1	Ben	Benisch	Fuchsstrasse	4	94853	Dresden	DEU		
16	1	Mandy	Mueller	Reisstrasse	67	395	Sachsonia	AFG		
17	1	Zyzwyorg	Xyzorz	Zeiger Street	19	7384	Zgorcelec	POL	zyzwyorg@xyzorz.pl	
18	1	Christoph 	Wellm	Gruener Weg 	6	06295	Eisleben	DEU	christoph_wellm@web.de	0135 943855
19	1	Maya	Sedzian	Green Valley	89	89345	Shangria	FRO	maya.sedzian@gmx.de	
20	1	Fenia	Muya	Nw Street	33	93586	Mounatin Dew	AND	fenia.muya@gmail.com	
27	1	a	b	ert	234	444	dfg	DEU		
30	1	sss	sss	sssss	666	345	sss	DEU		
31	1	Oh my	Gosh	Streetview	22	33456	Munich	GBR	oh.my.gosh@gmal.com	93857
32	1	Gmail	gmail	gmail	456	1199	gmail	RUS	gmail@gmail.com	
33	1	Mike	Mechanic	Hudson Street	9	11987	London	GBR		0045 3458573
11	1	Endor	Fuvi	Gribi Nabo	45	1234	Hremish	TUR		
13	1	Maria	Musel	Rattaat	46	123456	Habich	BEN		
23	1	a	b	ertz	234	444	dfg	\N		
34	1	Jenia	Polovnia	Gugelhupf	33	00445	Moscow	RUS	jenia.polovnia@gmail.ru	+33 0569345
\.


--
-- Data for Name: user_stored_music; Type: TABLE DATA; Schema: public; Owner: react_robot
--

COPY public.user_stored_music (id, user_id, interpreter, musical_piece_name, music_link) FROM stdin;
1	1	Beam & Yanou	Sound Of Love	https://www.youtube.com/watch?v=VekGfiAmakM
2	1	Michael Jackson	Billie Jean	https://www.youtube.com/watch?v=Zi_XLOBDo_Y&list=RDEMe12_MlgO8mGFdeeftZ2nOQ&start_radio=1
3	1	Captain Jack	Captain Jack	https://www.youtube.com/watch?v=0Bb_w7nOBwg&list=RD0Bb_w7nOBwg
\.


--
-- Data for Name: foo; Type: TABLE DATA; Schema: react_app; Owner: react_robot
--

COPY react_app.foo  FROM stdin;
\.


--
-- Data for Name: email_at; Type: TABLE DATA; Schema: testing; Owner: postgres
--

COPY testing.email_at (id, email) FROM stdin;
1	a@b.de
\.


--
-- Name: app_users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: react_robot
--

SELECT pg_catalog.setval('public.app_users_user_id_seq', 4, true);


--
-- Name: user_stored_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: react_robot
--

SELECT pg_catalog.setval('public.user_stored_addresses_id_seq', 34, true);


--
-- Name: user_stored_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: react_robot
--

SELECT pg_catalog.setval('public.user_stored_music_id_seq', 3, true);


--
-- Name: app_users app_users_pkey; Type: CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.app_users
    ADD CONSTRAINT app_users_pkey PRIMARY KEY (user_id);


--
-- Name: continent_codes continent_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.continent_codes
    ADD CONSTRAINT continent_codes_pkey PRIMARY KEY (code);


--
-- Name: country_codes country_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.country_codes
    ADD CONSTRAINT country_codes_pkey PRIMARY KEY (code);


--
-- Name: country_codes iso3_unique; Type: CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.country_codes
    ADD CONSTRAINT iso3_unique UNIQUE (iso3);


--
-- Name: user_stored_addresses user_stored_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.user_stored_addresses
    ADD CONSTRAINT user_stored_addresses_pkey PRIMARY KEY (id);


--
-- Name: user_stored_music user_stored_music_pkey; Type: CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.user_stored_music
    ADD CONSTRAINT user_stored_music_pkey PRIMARY KEY (id);


--
-- Name: continent_code; Type: INDEX; Schema: public; Owner: react_robot
--

CREATE INDEX continent_code ON public.country_codes USING btree (continent_code);


--
-- Name: user_stored_addresses country_iso3; Type: FK CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.user_stored_addresses
    ADD CONSTRAINT country_iso3 FOREIGN KEY (country) REFERENCES public.country_codes(iso3);


--
-- Name: country_codes fk_countries_continents; Type: FK CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.country_codes
    ADD CONSTRAINT fk_countries_continents FOREIGN KEY (continent_code) REFERENCES public.continent_codes(code);


--
-- Name: user_stored_addresses user_stored_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.user_stored_addresses
    ADD CONSTRAINT user_stored_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_users(user_id);


--
-- Name: user_stored_music user_stored_music_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: react_robot
--

ALTER TABLE ONLY public.user_stored_music
    ADD CONSTRAINT user_stored_music_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_users(user_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "testdb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: testdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE testdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'de_DE.UTF-8';


ALTER DATABASE testdb OWNER TO postgres;

\connect testdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: testtable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testtable (
    info character varying(255)
);


ALTER TABLE public.testtable OWNER TO postgres;

--
-- Data for Name: testtable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testtable (info) FROM stdin;
ÄÖÜäöü
\.


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

