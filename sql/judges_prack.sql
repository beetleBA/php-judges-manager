--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: judges_prack; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE judges_prack WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE judges_prack OWNER TO postgres;

\connect judges_prack

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: competition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competition (
    id integer NOT NULL,
    num text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    name text NOT NULL,
    region_id integer
);


ALTER TABLE public.competition OWNER TO postgres;

--
-- Name: competition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.competition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.competition_id_seq OWNER TO postgres;

--
-- Name: competition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.competition_id_seq OWNED BY public.competition.id;


--
-- Name: judge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.judge (
    id integer NOT NULL,
    birth_date date,
    inn character varying(12),
    snils character varying(14),
    email character varying(254),
    surname character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    patronymic character varying(100),
    region_id integer,
    position_id integer
);


ALTER TABLE public.judge OWNER TO postgres;

--
-- Name: judge_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.judge_category (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    spelling character varying(200)
);


ALTER TABLE public.judge_category OWNER TO postgres;

--
-- Name: judge_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.judge_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.judge_category_id_seq OWNER TO postgres;

--
-- Name: judge_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.judge_category_id_seq OWNED BY public.judge_category.id;


--
-- Name: judge_competition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.judge_competition (
    id integer NOT NULL,
    num integer,
    judge_id integer NOT NULL,
    competition_id integer NOT NULL
);


ALTER TABLE public.judge_competition OWNER TO postgres;

--
-- Name: judge_competition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.judge_competition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.judge_competition_id_seq OWNER TO postgres;

--
-- Name: judge_competition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.judge_competition_id_seq OWNED BY public.judge_competition.id;


--
-- Name: judge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.judge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.judge_id_seq OWNER TO postgres;

--
-- Name: judge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.judge_id_seq OWNED BY public.judge.id;


--
-- Name: judgephone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.judgephone (
    id integer NOT NULL,
    phone character varying(12) NOT NULL,
    is_main boolean NOT NULL,
    note character varying(100),
    judge_id integer NOT NULL
);


ALTER TABLE public.judgephone OWNER TO postgres;

--
-- Name: judgephone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.judgephone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.judgephone_id_seq OWNER TO postgres;

--
-- Name: judgephone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.judgephone_id_seq OWNED BY public.judgephone.id;


--
-- Name: orderforcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderforcategory (
    id integer NOT NULL,
    certificate_number character varying(100),
    assigned_by_order character varying(200),
    extended_by_order character varying(200),
    valid_until date,
    file character varying(100),
    category_id integer NOT NULL,
    judge_id integer NOT NULL
);


ALTER TABLE public.orderforcategory OWNER TO postgres;

--
-- Name: orderforcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderforcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderforcategory_id_seq OWNER TO postgres;

--
-- Name: orderforcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderforcategory_id_seq OWNED BY public.orderforcategory.id;


--
-- Name: passport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passport (
    id integer NOT NULL,
    registration_address character varying(300) NOT NULL,
    number character varying(12) NOT NULL,
    issue_date date NOT NULL,
    issued_by character varying(300) NOT NULL,
    file character varying(100),
    judge_id integer NOT NULL
);


ALTER TABLE public.passport OWNER TO postgres;

--
-- Name: passport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passport_id_seq OWNER TO postgres;

--
-- Name: passport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passport_id_seq OWNED BY public.passport.id;


--
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.position_id_seq OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;


--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.region_id_seq OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: competition id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition ALTER COLUMN id SET DEFAULT nextval('public.competition_id_seq'::regclass);


--
-- Name: judge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge ALTER COLUMN id SET DEFAULT nextval('public.judge_id_seq'::regclass);


--
-- Name: judge_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge_category ALTER COLUMN id SET DEFAULT nextval('public.judge_category_id_seq'::regclass);


--
-- Name: judge_competition id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge_competition ALTER COLUMN id SET DEFAULT nextval('public.judge_competition_id_seq'::regclass);


--
-- Name: judgephone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judgephone ALTER COLUMN id SET DEFAULT nextval('public.judgephone_id_seq'::regclass);


--
-- Name: orderforcategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderforcategory ALTER COLUMN id SET DEFAULT nextval('public.orderforcategory_id_seq'::regclass);


--
-- Name: passport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport ALTER COLUMN id SET DEFAULT nextval('public.passport_id_seq'::regclass);


--
-- Name: position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: competition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competition (id, num, start_date, end_date, name, region_id) FROM stdin;
1	2002270018033400	2025-01-12	2025-01-12	ПЕРВЕНСТВО ДФО юноши до 18 лет	33
2	2002270018033400	2025-01-12	2025-01-12	ПЕРВЕНСТВО ДФО девушки до 16 лет	33
3	2002670017036290	2025-01-13	2025-01-13	ПЕРВЕНСТВО ПФО юноши до 18 лет	49
4	2002670445036290	2025-01-13	2025-01-13	ПЕРВЕНСТВО ПФО девушки до 16 лет	49
5	2004470017036290	2025-01-13	2025-01-13	ЧЕМПИОНАТ УФО женщины мужчины	80
6	2002670017035590	2025-01-13	2025-01-13	ПЕРВЕНСТВО УФО юноши до 18 лет	80
7	2002670017036990	2025-01-13	2025-01-13	ПЕРВЕНСТВО УФО юниоры до 23 лет	80
8	2002670017036320	2025-01-13	2025-01-13	ПЕРВЕНСТВО УФО юниоры до 20 лет	80
9	2002670012236290	2025-01-13	2025-01-13	ЧЕМПИОНАТ СЗФО женщины мужчины	81
10	2002670017036220	2025-01-13	2025-01-13	ПЕРВЕНСТВО СЗФО юноши до 18 лет	81
11	2002670017036310	2025-01-13	2025-01-13	ПЕРВЕНСТВО СЗФО юноши до 16 лет	81
12	2002670017036220	2025-01-13	2025-01-13	ПЕРВЕНСТВО СЗФО юниоры до 23 лет	81
13	2002670017036290	2025-01-13	2025-01-13	ПЕРВЕНСТВО СЗФО юниоры до 20 лет	81
14	2002670017036290	2025-01-18	2025-01-18	ЧЕМПИОНАТ ЦФО женщины мужчины	72
\.


--
-- Data for Name: judge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.judge (id, birth_date, inn, snils, email, surname, name, patronymic, region_id, position_id) FROM stdin;
1	2001-01-01	9232453344	232-223-453 41	ivanov@ivanov.ru	Иванов	Иван	Иванович	1	3
2	2001-01-02	9232453345	232-223-453 42	petrov@petrov.ru	Петров	Пётр	Петрович	4	1
3	2001-01-03	9232453346	232-223-453 43	sidorov@sidorov.ru	Сидоров	Сидор	Сидорович	33	1
4	2001-01-04	9232453347	232-223-453 44	popov@popov.ru	Попов	Сергей	Сергеевич	3	2
5	2001-01-05	9232453348	232-223-453 45	nikolaev@nikolaev.ru	Николаев	Николай	Николаевич	1	2
6	2001-01-06	9232453349	232-223-453 46	smirnov@smirnov.ru	Смирнов	Алексей	Алексеевич	23	2
7	2001-01-07	9232453350	232-223-453 47	tarasov@tarasov.ru	Тарасов	Тарас	Тарасович	44	1
8	2001-01-08	9232453351	232-223-453 48	mikhailov@mikhailov.ru	Михайлов	Михаил	Михайлович	45	1
9	2001-01-09	9232453352	232-223-453 49	lebedev@lebedev.ru	Лебедев	Владимир	Владимирович	89	3
10	2001-01-10	9232453353	232-223-453 50	bogdanov@bogdanov.ru	Богданов	Богдан	Богданович	12	1
\.


--
-- Data for Name: judge_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.judge_category (id, name, spelling) FROM stdin;
1	ССВК	Спортивный судья высшей категории 
2	СС1К	Спортивный судья 1 категории 
3	СС2К	Спортивный судья 2 категории 
4	СС3К	Спортивный судья 3 категории 
\.


--
-- Data for Name: judge_competition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.judge_competition (id, num, judge_id, competition_id) FROM stdin;
1	1	1	1
2	2	2	1
3	3	3	1
4	4	4	1
5	5	5	1
6	6	6	1
7	7	7	1
8	8	8	1
9	9	9	1
10	1	1	3
11	2	2	3
12	3	3	3
13	1	4	2
14	2	5	2
15	3	6	2
16	4	7	2
17	5	8	2
18	6	9	2
19	7	1	2
20	8	2	2
21	9	3	2
22	10	10	2
\.


--
-- Data for Name: judgephone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.judgephone (id, phone, is_main, note, judge_id) FROM stdin;
1	+77777777777	f	Служебный	1
2	+77777777778	f	Резервный	2
3	+77777777779	t		1
4	+77777777780	t		2
5	+77777777781	t		3
6	+77777777782	t		4
\.


--
-- Data for Name: orderforcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderforcategory (id, certificate_number, assigned_by_order, extended_by_order, valid_until, file, category_id, judge_id) FROM stdin;
1	№051970	от 22.01.2020 г. № 2-нг	№51 от 21 01 2022 г.	2026-01-12	\N	2	6
2	№053971	от 22.01.2013 г. № 12-нг	№112 от 12.01.2021 г.	2020-01-01	\N	1	3
3	№041972	от 22.01.2025 г. № 42-нг	№54 от 01.10.2025 г.	2025-12-31	\N	1	1
\.


--
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passport (id, registration_address, number, issue_date, issued_by, file, judge_id) FROM stdin;
3	г. Москва	45 00 123456	2010-01-11	ОТДЕЛОМ УФМС РОССИИ	\N	1
4	Свердловская обл., г. Екатеринбург	46 00 123456	2014-05-13	ОТДЕЛОМ УФМС РОССИИ	\N	6
5	Свердловская обл., г. Екатеринбург	47 00 123456	2011-01-06	ОТДЕЛОМ УФМС РОССИИ	\N	2
6	Курганская обл., г. Курган	48 00 123456	2013-12-01	ОТДЕЛОМ УФМС РОССИИ	\N	3
7	Курганская обл., г. Шадринск	49 00 123456	2010-12-13	ОТДЕЛОМ УФМС РОССИИ	\N	4
8	Челябинская обл., г. Челябинск	41 00 123456	2010-02-11	ОТДЕЛОМ УФМС РОССИИ	\N	5
\.


--
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id, name) FROM stdin;
1	Главный спортивный судья
2	Главный спортивный судья-секретарь
3	Заместитель главного спортивного судьи
4	Спортивный судья
5	Технический делегат
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, name) FROM stdin;
1	Республика Адыгея
2	Республика Алтай
3	Республика Башкортостан
4	Республика Бурятия
5	Республика Дагестан
6	Донецкая Народная Республика
7	Республика Ингушетия
8	Кабардино-Балкарская Республика
9	Республика Калмыкия
10	Карачаево-Черкесская Республика
11	Республика Карелия
12	Республика Коми
13	Республика Крым
14	Луганская Народная Республика
15	Республика Марий Эл
16	Республика Мордовия
17	Республика Саха (Якутия)
18	Республика Северная Осетия — Алания
19	Республика Татарстан
20	Республика Тыва
21	Удмуртская Республика
22	Республика Хакасия
23	Чеченская Республика
24	Чувашская Республика — Чувашия
25	Алтайский край
26	Забайкальский край
27	Камчатский край
28	Краснодарский край
29	Красноярский край
30	Пермский край
31	Приморский край
32	Ставропольский край
33	Хабаровский край
34	Амурская область
35	Архангельская область
36	Астраханская область
37	Белгородская область
38	Брянская область
39	Владимирская область
40	Волгоградская область
41	Вологодская область
42	Воронежская область
43	Запорожская область
44	Ивановская область
45	Иркутская область
46	Калининградская область
47	Калужская область
48	Кемеровская область — Кузбасс
49	Кировская область
50	Костромская область
51	Курганская область
52	Курская область
53	Ленинградская область
54	Липецкая область
55	Магаданская область
56	Московская область
57	Мурманская область
58	Нижегородская область
59	Новгородская область
60	Новосибирская область
61	Омская область
62	Оренбургская область
63	Орловская область
64	Пензенская область
65	Псковская область
66	Ростовская область
67	Рязанская область
68	Самарская область
69	Саратовская область
70	Сахалинская область
71	Свердловская область
72	Смоленская область
73	Тамбовская область
74	Тверская область
75	Томская область
76	Тульская область
77	Тюменская область
78	Ульяновская область
79	Херсонская область
80	Челябинская область
81	Ярославская область
82	Москва
83	Санкт-Петербург
84	Севастополь
85	Еврейская автономная область
86	Ненецкий автономный округ
87	Ханты-Мансийский автономный округ — Югра
88	Чукотский автономный округ
89	Ямало-Ненецкий автономный округ
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name) FROM stdin;
1	Администратор
2	Пользователь
3	Главный судья
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, login, password, role_id) FROM stdin;
1	admin	password	1
2	user1	password	2
3	user2	password	2
4	chief_judge	password	3
\.


--
-- Name: competition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.competition_id_seq', 14, true);


--
-- Name: judge_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.judge_category_id_seq', 4, true);


--
-- Name: judge_competition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.judge_competition_id_seq', 22, true);


--
-- Name: judge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.judge_id_seq', 10, true);


--
-- Name: judgephone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.judgephone_id_seq', 6, true);


--
-- Name: orderforcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderforcategory_id_seq', 3, true);


--
-- Name: passport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passport_id_seq', 8, true);


--
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 5, true);


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: competition competition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition
    ADD CONSTRAINT competition_pkey PRIMARY KEY (id);


--
-- Name: judge_category judge_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge_category
    ADD CONSTRAINT judge_category_pkey PRIMARY KEY (id);


--
-- Name: judge_competition judge_competition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge_competition
    ADD CONSTRAINT judge_competition_pkey PRIMARY KEY (id);


--
-- Name: judge judge_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge
    ADD CONSTRAINT judge_email_key UNIQUE (email);


--
-- Name: judge judge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge
    ADD CONSTRAINT judge_pkey PRIMARY KEY (id);


--
-- Name: judgephone judgephone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judgephone
    ADD CONSTRAINT judgephone_pkey PRIMARY KEY (id);


--
-- Name: orderforcategory orderforcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderforcategory
    ADD CONSTRAINT orderforcategory_pkey PRIMARY KEY (id);


--
-- Name: passport passport_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_judge_id_key UNIQUE (judge_id);


--
-- Name: passport passport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (id);


--
-- Name: position position_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_name_key UNIQUE (name);


--
-- Name: position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- Name: region region_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_name_key UNIQUE (name);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: user user_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_login_key UNIQUE (login);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: competition competition_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competition
    ADD CONSTRAINT competition_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: judge_competition judge_competition_competition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge_competition
    ADD CONSTRAINT judge_competition_competition_id_fkey FOREIGN KEY (competition_id) REFERENCES public.competition(id);


--
-- Name: judge_competition judge_competition_judge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge_competition
    ADD CONSTRAINT judge_competition_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.judge(id);


--
-- Name: judge judge_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge
    ADD CONSTRAINT judge_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."position"(id);


--
-- Name: judge judge_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge
    ADD CONSTRAINT judge_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: judgephone judgephone_judge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judgephone
    ADD CONSTRAINT judgephone_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.judge(id);


--
-- Name: orderforcategory orderforcategory_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderforcategory
    ADD CONSTRAINT orderforcategory_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.judge_category(id);


--
-- Name: orderforcategory orderforcategory_judge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderforcategory
    ADD CONSTRAINT orderforcategory_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.judge(id);


--
-- Name: passport passport_judge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.judge(id);


--
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

