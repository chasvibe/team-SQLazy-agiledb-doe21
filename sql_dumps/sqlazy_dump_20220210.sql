--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.cart OWNER TO sl;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: sl
--

CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cart_id_seq OWNER TO sl;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sl
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL
);


ALTER TABLE public.category OWNER TO sl;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: sl
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO sl;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sl
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: enrollment; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.enrollment (
    role_id integer NOT NULL,
    email character varying(320) NOT NULL
);


ALTER TABLE public.enrollment OWNER TO sl;

--
-- Name: group_entry; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.group_entry (
    group_id integer NOT NULL,
    email character varying(320) NOT NULL,
    entry text NOT NULL,
    time_date timestamp without time zone
);


ALTER TABLE public.group_entry OWNER TO sl;

--
-- Name: group_member; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.group_member (
    email character varying(320) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.group_member OWNER TO sl;

--
-- Name: group_profile; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.group_profile (
    group_id integer NOT NULL,
    group_name character varying(40) NOT NULL
);


ALTER TABLE public.group_profile OWNER TO sl;

--
-- Name: group_profile_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sl
--

CREATE SEQUENCE public.group_profile_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_profile_group_id_seq OWNER TO sl;

--
-- Name: group_profile_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sl
--

ALTER SEQUENCE public.group_profile_group_id_seq OWNED BY public.group_profile.group_id;


--
-- Name: private_message; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.private_message (
    time_date timestamp without time zone NOT NULL,
    message text NOT NULL,
    creator character varying(320) NOT NULL,
    receiver character varying(320) NOT NULL
);


ALTER TABLE public.private_message OWNER TO sl;

--
-- Name: product; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    price numeric(15,6) NOT NULL,
    description text NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.product OWNER TO sl;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: sl
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO sl;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sl
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO sl;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: sl
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_role_id_seq OWNER TO sl;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sl
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: user_order; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.user_order (
    order_id integer NOT NULL,
    email character varying(320) NOT NULL,
    order_status integer NOT NULL,
    total_price numeric(15,6) NOT NULL
);


ALTER TABLE public.user_order OWNER TO sl;

--
-- Name: user_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: sl
--

CREATE SEQUENCE public.user_order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_order_order_id_seq OWNER TO sl;

--
-- Name: user_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sl
--

ALTER SEQUENCE public.user_order_order_id_seq OWNED BY public.user_order.order_id;


--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: sl
--

CREATE TABLE public.user_profile (
    email character varying(320) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.user_profile OWNER TO sl;

--
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: group_profile group_id; Type: DEFAULT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.group_profile ALTER COLUMN group_id SET DEFAULT nextval('public.group_profile_group_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: user_order order_id; Type: DEFAULT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.user_order ALTER COLUMN order_id SET DEFAULT nextval('public.user_order_order_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.cart (cart_id, order_id, product_id) FROM stdin;
1	3	5
2	4	7
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.category (category_id, category_name) FROM stdin;
1	dogs
2	cats
3	bunnies
4	fish and reptiles
\.


--
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.enrollment (role_id, email) FROM stdin;
1	viktor.berg@chasacademy.se
2	daniel.lapington@chasacademy.se
3	erik.olsson2@chasacademy.se
4	tomas.karlsson@chasacademy.se
\.


--
-- Data for Name: group_entry; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.group_entry (group_id, email, entry, time_date) FROM stdin;
1	viktor.berg@chasacademy.se	Lets go to the mall and shop! <3	2022-02-10 14:36:32.480531
1	tomas.karlsson@chasacademy.se	No.	2022-02-10 14:37:25.67173
1	erik.olsson2@chasacademy.se	No.	2022-02-10 14:37:36.36106
1	daniel.lapington@chasacademy.se	No.	2022-02-10 14:37:45.245717
\.


--
-- Data for Name: group_member; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.group_member (email, group_id) FROM stdin;
viktor.berg@chasacademy.se	1
daniel.lapington@chasacademy.se	1
tomas.karlsson@chasacademy.se	1
erik.olsson2@chasacademy.se	1
\.


--
-- Data for Name: group_profile; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.group_profile (group_id, group_name) FROM stdin;
1	SQLazy
2	Ramones
3	Wham!
4	We who love SQL
\.


--
-- Data for Name: private_message; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.private_message (time_date, message, creator, receiver) FROM stdin;
2022-02-10 14:24:46.789087	Hello, what are you wearing?	viktor.berg@chasacademy.se	daniel.lapington@chasacademy.se
2022-02-10 14:26:36.588248	Are we still meeting at the same place?	erik.olsson2@chasacademy.se	tomas.karlsson@chasacademy.se
2022-02-10 14:27:15.512884	Nothing at all...	daniel.lapington@chasacademy.se	viktor.berg@chasacademy.se
2022-02-10 14:27:53.330382	You know, my wife is getting suspicious..	tomas.karlsson@chasacademy.se	erik.olsson2@chasacademy.se
2022-02-10 14:29:00.756507	Screw that, bring her!	erik.olsson2@chasacademy.se	tomas.karlsson@chasacademy.se
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.product (product_id, product_name, quantity, price, description, category_id) FROM stdin;
1	Dog leash	4	19.990000	Leather leash with nice grip	1
2	Fish tank	2	199.990000	Fish tank with polished glas and automated feeding	4
3	Salt stone	7	4.990000	Salt stone for bunnies and small animals	3
4	Hay hedge	5	7.990000	Hay hedge for big cage confinement	3
5	Collar	8	12.990000	Chain collar for dogs	1
6	Litter box	4	18.990000	Litter box for cats	2
7	Mouse toy	9	1.990000	Mouse toy for cats	2
8	Chew toy	3	4.990000	Chew toy for medium breed dogs	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.roles (role_id, role_name) FROM stdin;
1	user
2	paid user
3	admin
4	owner
\.


--
-- Data for Name: user_order; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.user_order (order_id, email, order_status, total_price) FROM stdin;
3	tomas.karlsson@chasacademy.se	4	12.990000
4	viktor.berg@chasacademy.se	2	1.990000
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: sl
--

COPY public.user_profile (email, first_name, last_name, is_active) FROM stdin;
jane.doe@chasacademy.se	Jane	Doe	t
johnny.doe@chasacademy.se	John	Doe	t
garr.smith@chasacademy.se	Gary	Smith	f
viktor.berg@chasacademy.se	Viktor	Berg	t
daniel.lapington@chasacademy.se	Daniel	Lapington	t
tomas.karlsson@chasacademy.se	Tomas	Karlsson	t
erik.olsson2@chasacademy.se	Erik	Olsson	t
\.


--
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sl
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 2, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sl
--

SELECT pg_catalog.setval('public.category_category_id_seq', 4, true);


--
-- Name: group_profile_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sl
--

SELECT pg_catalog.setval('public.group_profile_group_id_seq', 4, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sl
--

SELECT pg_catalog.setval('public.product_product_id_seq', 8, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sl
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 4, true);


--
-- Name: user_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sl
--

SELECT pg_catalog.setval('public.user_order_order_id_seq', 4, true);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- Name: category category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_name_key UNIQUE (category_name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: group_profile group_profile_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.group_profile
    ADD CONSTRAINT group_profile_group_name_key UNIQUE (group_name);


--
-- Name: group_profile group_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.group_profile
    ADD CONSTRAINT group_profile_pkey PRIMARY KEY (group_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: product product_product_name_key; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_name_key UNIQUE (product_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- Name: user_order user_order_pkey; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.user_order
    ADD CONSTRAINT user_order_pkey PRIMARY KEY (order_id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (email);


--
-- Name: private_message creator; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.private_message
    ADD CONSTRAINT creator FOREIGN KEY (creator) REFERENCES public.user_profile(email);


--
-- Name: product fk_category_id; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- Name: enrollment fk_email; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT fk_email FOREIGN KEY (email) REFERENCES public.user_profile(email);


--
-- Name: group_entry fk_email; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.group_entry
    ADD CONSTRAINT fk_email FOREIGN KEY (email) REFERENCES public.user_profile(email);


--
-- Name: group_member fk_email; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.group_member
    ADD CONSTRAINT fk_email FOREIGN KEY (email) REFERENCES public.user_profile(email);


--
-- Name: user_order fk_email; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.user_order
    ADD CONSTRAINT fk_email FOREIGN KEY (email) REFERENCES public.user_profile(email);


--
-- Name: group_entry fk_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.group_entry
    ADD CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES public.group_profile(group_id);


--
-- Name: group_member fk_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.group_member
    ADD CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES public.group_profile(group_id);


--
-- Name: cart fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.user_order(order_id);


--
-- Name: cart fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: enrollment fk_role_id; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: private_message receiver; Type: FK CONSTRAINT; Schema: public; Owner: sl
--

ALTER TABLE ONLY public.private_message
    ADD CONSTRAINT receiver FOREIGN KEY (receiver) REFERENCES public.user_profile(email);


--
-- PostgreSQL database dump complete
--

