--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: users; Type: TABLE; Schema: public; Owner: eugenelevin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    password_hash text NOT NULL,
    name text NOT NULL,
    photo_url text NOT NULL,
    gender character(1) NOT NULL,
    age integer NOT NULL,
    pref_age_from integer,
    pref_age_to integer,
    pref_gender character(1)
);


ALTER TABLE public.users OWNER TO eugenelevin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: eugenelevin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO eugenelevin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eugenelevin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: eugenelevin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: eugenelevin
--

COPY public.users (id, email, password_hash, name, photo_url, gender, age, pref_age_from, pref_age_to, pref_gender) FROM stdin;
9	tony@gmail.com	$2b$12$hEwKYrj6ek308PvYIZkdQu3IKJyOssi/omikaJeu4.0Mcoh6qQgzC	Tony	https://images.unsplash.com/photo-1440133197387-5a6020d5ace2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njh8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	m	36	25	35	f
10	claire@gmail.com	$2b$12$JZS9z51uaWy49sYYDwHaQ.qBA/vPUSQsEkNQh6sNAXCF/w2QWPBf.	Claire	https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	f	27	20	43	m
4	hisu@gmail.com	$2b$12$yCbybVjigylKoOUVEUZ5zuWSkMJIXIKb6bfmf9yximIbu2iUyhVAa	Hisu	https://images.unsplash.com/photo-1439778615639-28529f7628bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	f	24	24	35	o
12	james@gmail.com	$2b$12$vaLyBmBTIzd5uRx703xf7u3M0zUJeamr5zA11je4jx..0CeGRZNzO	James	https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60	m	25	20	29	f
6	kate@gmail.com	$2b$12$nGuLw1ey5.T0Tj.Z5WoQ.evEBa4a0ertU7G3QZ2QTlxLG1n3EAJn.	Kate	https://images.unsplash.com/photo-1534350131724-2a405f7108cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	f	29	25	35	m
11	holly@gmail.com	$2b$12$UHuqXER3a5gbhvXitfzVHe99PZzK61w99zylVWZR9w.PQMjzDq6qq	Holly	https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	f	29	29	43	m
7	jenny@gmail.com	$2b$12$o.Lr2cCZokZ3LyGJB9fAj.PsTtarBZmZAZlvzfvt3hD.vA5U4M5sy	Jenny	https://images.unsplash.com/photo-1481824429379-07aa5e5b0739?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	f	25	25	43	m
1	jenya.levin@gmail.com	$2b$12$EdPRqIVzwzJrkXW8nC9RXO0seuSJGOOnG.0W/9awFltCIUA1uwWOO	Eugene	https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60	m	42	25	42	f
3	dave@gmail.com	$2b$12$EdPRqIVzwzJrkXW8nC9RXO0seuSJGOOnG.0W/9awFltCIUA1uwWOO	Dave	https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	m	42	35	42	f
8	tom@gmail.com	$2b$12$TTPzyqB3ZLsdQvPcFLBUwOX0GmK6om4C2/p1T4tA7PTZ7vzeK3ijy	Tom	https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60	m	32	27	35	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eugenelevin
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: eugenelevin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

