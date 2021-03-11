--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: enum_Modifiers_availableStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."enum_Modifiers_availableStatus" AS ENUM (
    'AVAILABLE',
    'UNAVAILABLE'
);


--
-- Name: enum_categories_availableStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."enum_categories_availableStatus" AS ENUM (
    'AVAILABLE',
    'UNAVAILABLE',
    'HIDE'
);


--
-- Name: enum_items_availableStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."enum_items_availableStatus" AS ENUM (
    'AVAILABLE',
    'UNAVAILABLE'
);


--
-- Name: enum_modifier_groups_availableStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."enum_modifier_groups_availableStatus" AS ENUM (
    'AVAILABLE',
    'UNAVAILABLE'
);


--
-- Name: enum_modifiers_availableStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."enum_modifiers_availableStatus" AS ENUM (
    'AVAILABLE',
    'UNAVAILABLE'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(60),
    "availableStatus" public."enum_categories_availableStatus",
    "sectionId" integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.currencies (
    id integer NOT NULL,
    code character varying(10),
    exponent integer,
    symbol character varying(5),
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.currencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: item_modifierGroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."item_modifierGroup" (
    id integer NOT NULL,
    "itemId" integer,
    "modifierGroupId" integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: item_modifierGroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."item_modifierGroup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_modifierGroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."item_modifierGroup_id_seq" OWNED BY public."item_modifierGroup".id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(60),
    "availableStatus" public."enum_items_availableStatus",
    description character varying(200),
    price integer,
    photos character varying(255)[],
    "specialType" character varying(20),
    "categoryId" integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    "merchantId" integer,
    name character varying(255),
    "currencyId" integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: modifier_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifier_groups (
    id integer NOT NULL,
    name character varying(255),
    "availableStatus" public."enum_modifier_groups_availableStatus",
    "selectionRangeMin" integer,
    "selectionRangeMax" integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: modifier_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modifier_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modifier_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modifier_groups_id_seq OWNED BY public.modifier_groups.id;


--
-- Name: modifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifiers (
    id integer NOT NULL,
    name character varying(40),
    "availableStatus" public."enum_modifiers_availableStatus",
    price integer,
    "modifierGroupId" integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: modifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modifiers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modifiers_id_seq OWNED BY public.modifiers.id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sections (
    id integer NOT NULL,
    name character varying(255),
    "serviceHours" json,
    "menuId" integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: item_modifierGroup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."item_modifierGroup" ALTER COLUMN id SET DEFAULT nextval('public."item_modifierGroup_id_seq"'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: modifier_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_groups ALTER COLUMN id SET DEFAULT nextval('public.modifier_groups_id_seq'::regclass);


--
-- Name: modifiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifiers ALTER COLUMN id SET DEFAULT nextval('public.modifiers_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SequelizeMeta" (name) FROM stdin;
20210309162201-create-currency.js
20210309171445-create-menu.js
20210310023459-create-section.js
20210310023739-create-category.js
20210310034401-create-item.js
20210310041224-create-modifier-group.js
20210310043106-create-item-modifier-group.js
20210310045823-create-modifier.js
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, "availableStatus", "sectionId", "createdAt", "updatedAt") FROM stdin;
1	Burgers	AVAILABLE	3	2021-03-11 11:14:53.143628+07	2021-03-11 11:14:53.143628+07
2	Promotion	AVAILABLE	3	2021-03-11 11:14:53.143628+07	2021-03-11 11:14:53.143628+07
3	Chicken	AVAILABLE	3	2021-03-11 11:14:53.143628+07	2021-03-11 11:14:53.143628+07
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.currencies (id, code, exponent, symbol, "createdAt", "updatedAt") FROM stdin;
3	SGD	2	S$	2021-03-10 23:39:45.050858+07	2021-03-10 23:39:45.050858+07
4	USD	2	$	2021-03-10 23:39:45.050858+07	2021-03-10 23:39:45.050858+07
5	VND	0	đ	2021-03-10 23:39:45.050858+07	2021-03-10 23:39:45.050858+07
\.


--
-- Data for Name: item_modifierGroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."item_modifierGroup" (id, "itemId", "modifierGroupId", "createdAt", "updatedAt") FROM stdin;
1	1	4	2021-03-11 13:00:07.714141+07	2021-03-11 13:00:07.714141+07
2	1	5	2021-03-11 13:00:07.714141+07	2021-03-11 13:00:07.714141+07
3	1	6	2021-03-11 13:00:07.714141+07	2021-03-11 13:00:07.714141+07
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.items (id, name, "availableStatus", description, price, photos, "specialType", "categoryId", "createdAt", "updatedAt") FROM stdin;
1	Cheeseburger Deluxe	AVAILABLE	Burger	2	\N	\N	1	2021-03-11 11:15:07.939408+07	2021-03-11 11:15:07.939408+07
2	Double Cheeseburger	AVAILABLE	Burger	3	\N	\N	1	2021-03-11 11:15:07.939408+07	2021-03-11 11:15:07.939408+07
3	Combo 2A	AVAILABLE	Combo	7	\N	\N	2	2021-03-11 11:15:07.939408+07	2021-03-11 11:15:07.939408+07
4	Combo 3B	AVAILABLE	Combo	8	\N	\N	2	2021-03-11 11:15:07.939408+07	2021-03-11 11:15:07.939408+07
5	3pcs Fried Chickens	AVAILABLE	Chicken	5	\N	\N	3	2021-03-11 11:15:07.939408+07	2021-03-11 11:15:07.939408+07
6	2pcs Fried Chicken Meal	AVAILABLE	Chicken	4	\N	\N	3	2021-03-11 11:15:07.939408+07	2021-03-11 11:15:07.939408+07
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.menus (id, "merchantId", name, "currencyId", "createdAt", "updatedAt") FROM stdin;
1	1	Menu 1	4	2021-03-11 01:26:53.018121+07	2021-03-11 01:26:53.018121+07
\.


--
-- Data for Name: modifier_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.modifier_groups (id, name, "availableStatus", "selectionRangeMin", "selectionRangeMax", "createdAt", "updatedAt") FROM stdin;
4	BurgerSize	AVAILABLE	1	1	2021-03-11 12:33:19.44503+07	2021-03-11 12:33:19.44503+07
5	BurgerExtra	AVAILABLE	0	4	2021-03-11 12:33:19.44503+07	2021-03-11 12:33:19.44503+07
6	SoftDrink	AVAILABLE	0	1	2021-03-11 12:33:19.44503+07	2021-03-11 12:33:19.44503+07
\.


--
-- Data for Name: modifiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.modifiers (id, name, "availableStatus", price, "modifierGroupId", "createdAt", "updatedAt") FROM stdin;
1	S	AVAILABLE	0	4	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
2	M	AVAILABLE	2	4	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
3	L	AVAILABLE	3	4	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
4	Cheese	AVAILABLE	1	5	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
5	Beef	AVAILABLE	2	5	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
6	Salad	AVAILABLE	1	5	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
7	Pepsi	AVAILABLE	1	6	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
8	Cocacola	AVAILABLE	2	6	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
9	7up	AVAILABLE	3	6	2021-03-11 12:36:37.441681+07	2021-03-11 12:36:37.441681+07
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sections (id, name, "serviceHours", "menuId", "createdAt", "updatedAt") FROM stdin;
1	Breakfast	{"mon":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"08:00","endTime":"11:00"}]},"tue":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"08:00","endTime":"11:00"}]},"wed":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"08:00","endTime":"11:00"}]},"thu":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"08:00","endTime":"11:00"}]},"fri":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"08:00","endTime":"11:00"}]},"sat":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"08:00","endTime":"11:00"}]},"sun":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"08:00","endTime":"11:00"}]}}	1	2021-03-11 01:39:41.12622+07	2021-03-11 01:39:41.12622+07
2	Lunch	{"mon":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"12:00","endTime":"14:00"}]},"tue":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"12:00","endTime":"14:00"}]},"wed":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"12:00","endTime":"14:00"}]},"thu":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"12:00","endTime":"14:00"}]},"fri":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"12:00","endTime":"14:00"}]},"sat":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"12:00","endTime":"14:00"}]},"sun":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"12:00","endTime":"14:00"}]}}	1	2021-03-11 01:39:41.12622+07	2021-03-11 01:39:41.12622+07
3	Regular	{"mon":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"15:00","endTime":"22:00"}]},"tue":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"15:00","endTime":"22:00"}]},"wed":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"15:00","endTime":"22:00"}]},"thu":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"15:00","endTime":"22:00"}]},"fri":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"15:00","endTime":"22:00"}]},"sat":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"15:00","endTime":"22:00"}]},"sun":{"openPeriodType":"OpenPeriod","periods":[{"startTime":"15:00","endTime":"22:00"}]}}	1	2021-03-11 01:39:41.12622+07	2021-03-11 01:39:41.12622+07
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.currencies_id_seq', 5, true);


--
-- Name: item_modifierGroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."item_modifierGroup_id_seq"', 3, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.items_id_seq', 6, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, true);


--
-- Name: modifier_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modifier_groups_id_seq', 6, true);


--
-- Name: modifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modifiers_id_seq', 9, true);


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sections_id_seq', 3, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: item_modifierGroup item_modifierGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."item_modifierGroup"
    ADD CONSTRAINT "item_modifierGroup_pkey" PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: modifier_groups modifier_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_groups
    ADD CONSTRAINT modifier_groups_pkey PRIMARY KEY (id);


--
-- Name: modifiers modifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifiers
    ADD CONSTRAINT modifiers_pkey PRIMARY KEY (id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

