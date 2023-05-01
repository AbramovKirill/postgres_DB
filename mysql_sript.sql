--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.7

-- Started on 2023-05-01 11:49:47

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
-- TOC entry 210 (class 1259 OID 16522)
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    channel_id integer NOT NULL,
    channel_link character varying(50) NOT NULL,
    channel_name character varying(50) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16521)
-- Name: channel_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_channel_id_seq OWNER TO postgres;

--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 209
-- Name: channel_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_channel_id_seq OWNED BY public.channel.channel_id;


--
-- TOC entry 216 (class 1259 OID 16538)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    post_id integer NOT NULL,
    channel_id integer NOT NULL,
    text character varying(50) NOT NULL,
    date date NOT NULL,
    theme_id integer NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16536)
-- Name: post_channel_ids_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_channel_ids_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_channel_ids_seq OWNER TO postgres;

--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 214
-- Name: post_channel_ids_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_channel_ids_seq OWNED BY public.post.channel_id;


--
-- TOC entry 213 (class 1259 OID 16535)
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_id_seq OWNER TO postgres;

--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 213
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_post_id_seq OWNED BY public.post.post_id;


--
-- TOC entry 215 (class 1259 OID 16537)
-- Name: post_theme_ids_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_theme_ids_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_theme_ids_seq OWNER TO postgres;

--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 215
-- Name: post_theme_ids_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_theme_ids_seq OWNED BY public.post.theme_id;


--
-- TOC entry 212 (class 1259 OID 16529)
-- Name: theme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.theme (
    theme_id integer NOT NULL,
    theme_name character varying(50) NOT NULL,
    keywords character varying(50) NOT NULL
);


ALTER TABLE public.theme OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16528)
-- Name: theme_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.theme_theme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theme_theme_id_seq OWNER TO postgres;

--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 211
-- Name: theme_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.theme_theme_id_seq OWNED BY public.theme.theme_id;


--
-- TOC entry 217 (class 1259 OID 16556)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    provider character varying(50) NOT NULL,
    created date NOT NULL,
    signed_in date NOT NULL,
    "userUID" character varying(50) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 3804 (class 2604 OID 16525)
-- Name: channel channel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel ALTER COLUMN channel_id SET DEFAULT nextval('public.channel_channel_id_seq'::regclass);


--
-- TOC entry 3806 (class 2604 OID 16541)
-- Name: post post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN post_id SET DEFAULT nextval('public.post_post_id_seq'::regclass);


--
-- TOC entry 3807 (class 2604 OID 16542)
-- Name: post channel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN channel_id SET DEFAULT nextval('public.post_channel_ids_seq'::regclass);


--
-- TOC entry 3808 (class 2604 OID 16543)
-- Name: post theme_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN theme_id SET DEFAULT nextval('public.post_theme_ids_seq'::regclass);


--
-- TOC entry 3805 (class 2604 OID 16532)
-- Name: theme theme_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theme ALTER COLUMN theme_id SET DEFAULT nextval('public.theme_theme_id_seq'::regclass);


--
-- TOC entry 3959 (class 0 OID 16522)
-- Dependencies: 210
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.channel (channel_id, channel_link, channel_name, from_date, to_date) VALUES (1, '@link_1', 'channel_name_1', '2022-02-02', '2022-02-05');
INSERT INTO public.channel (channel_id, channel_link, channel_name, from_date, to_date) VALUES (2, '@link_2', 'channel_name_2', '2022-02-03', '2022-02-06');
INSERT INTO public.channel (channel_id, channel_link, channel_name, from_date, to_date) VALUES (3, '@link_3', 'channel_name_3', '2022-02-04', '2022-02-07');


--
-- TOC entry 3965 (class 0 OID 16538)
-- Dependencies: 216
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post (post_id, channel_id, text, date, theme_id) VALUES (1, 1, 'text_1', '2022-02-02', 1);
INSERT INTO public.post (post_id, channel_id, text, date, theme_id) VALUES (2, 2, 'text_2', '2022-02-03', 2);
INSERT INTO public.post (post_id, channel_id, text, date, theme_id) VALUES (3, 3, 'text_3', '2022-02-04', 3);


--
-- TOC entry 3961 (class 0 OID 16529)
-- Dependencies: 212
-- Data for Name: theme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.theme (theme_id, theme_name, keywords) VALUES (1, 'theme_name_1', 'keywords1, keywords2, keywords3');
INSERT INTO public.theme (theme_id, theme_name, keywords) VALUES (2, 'theme_name_2', 'keywords4, keywords5, keywords6');
INSERT INTO public.theme (theme_id, theme_name, keywords) VALUES (3, 'theme_name_3', 'keywords2, keywords5, keywords3');


--
-- TOC entry 3966 (class 0 OID 16556)
-- Dependencies: 217
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 209
-- Name: channel_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_channel_id_seq', 1, false);


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 214
-- Name: post_channel_ids_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_channel_ids_seq', 1, false);


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 213
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_post_id_seq', 1, false);


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 215
-- Name: post_theme_ids_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_theme_ids_seq', 1, false);


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 211
-- Name: theme_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theme_theme_id_seq', 1, false);


--
-- TOC entry 3810 (class 2606 OID 16527)
-- Name: channel channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (channel_id);


--
-- TOC entry 3814 (class 2606 OID 16545)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);


--
-- TOC entry 3812 (class 2606 OID 16534)
-- Name: theme theme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_pkey PRIMARY KEY (theme_id);


--
-- TOC entry 3816 (class 2606 OID 16560)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3818 (class 2606 OID 16551)
-- Name: post fkey_channel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fkey_channel FOREIGN KEY (channel_id) REFERENCES public.channel(channel_id) NOT VALID;


--
-- TOC entry 3817 (class 2606 OID 16546)
-- Name: post fkey_theme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fkey_theme FOREIGN KEY (theme_id) REFERENCES public.theme(theme_id) NOT VALID;


--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: cloudsqlsuperuser
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 230
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;


--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 218
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;


--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 219
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;


--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 220
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;


--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 221
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;


--
-- TOC entry 3978 (class 0 OID 0)
-- Dependencies: 222
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;


--
-- TOC entry 3979 (class 0 OID 0)
-- Dependencies: 231
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;


--
-- TOC entry 3980 (class 0 OID 0)
-- Dependencies: 223
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;


--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 224
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;


--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 225
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;


--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 226
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;


--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 232
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: cloudsqladmin
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;


-- Completed on 2023-05-01 11:50:05

--
-- PostgreSQL database dump complete
--

