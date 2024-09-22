--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO blog;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    content text NOT NULL,
    create_date timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.comments OWNER TO blog;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO blog;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    content text NOT NULL,
    create_date timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    time_read integer,
    slug text DEFAULT ''::text NOT NULL,
    upload_image boolean DEFAULT false NOT NULL
);


ALTER TABLE public.posts OWNER TO blog;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO blog;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_users_favorites; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.posts_users_favorites (
    user_id bigint NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE public.posts_users_favorites OWNER TO blog;

--
-- Name: users; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    description text NOT NULL,
    image text NOT NULL
);


ALTER TABLE public.users OWNER TO blog;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO blog;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
989d1316-b110-4b80-8335-3a4c83b65f47	d6144e1a0de959298ba849fecc0b95d1466607c44d3e74d2426f188ce71224b4	2024-08-24 22:14:21.569794+00	20240811223114_main	\N	\N	2024-08-24 22:14:21.527363+00	1
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.comments (id, user_id, post_id, content, create_date) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.posts (id, user_id, title, description, content, create_date, update_date, time_read, slug, upload_image) FROM stdin;
\.


--
-- Data for Name: posts_users_favorites; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.posts_users_favorites (user_id, post_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY public.users (id, name, email, password, description, image) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_users_favorites posts_users_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.posts_users_favorites
    ADD CONSTRAINT posts_users_favorites_pkey PRIMARY KEY (user_id, post_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: posts_users_favorites posts_users_favorites_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.posts_users_favorites
    ADD CONSTRAINT posts_users_favorites_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_users_favorites posts_users_favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY public.posts_users_favorites
    ADD CONSTRAINT posts_users_favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

