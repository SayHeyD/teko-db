--
-- PostgreSQL database dump
--

\restrict CVp5ej90RowgtqU3A1JtFw7fYcow25uv6W52bHbhyJRVh8UnU2ZZDMMjcz4dmG1

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.4 (Debian 18.4-1.pgdg13+1)

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
-- Name: bestellung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bestellung (
    bestellung_id integer NOT NULL,
    kunde_id integer NOT NULL,
    fahrer_id integer,
    bestelldatum timestamp without time zone DEFAULT now() NOT NULL,
    status character varying(20) DEFAULT 'offen'::character varying NOT NULL,
    lieferstrasse character varying(100) NOT NULL,
    lieferhausnummer character varying(10) NOT NULL,
    liefer_ort_id integer NOT NULL,
    CONSTRAINT bestellung_status_check CHECK (((status)::text = ANY ((ARRAY['offen'::character varying, 'unterwegs'::character varying, 'geliefert'::character varying, 'storniert'::character varying])::text[])))
);


ALTER TABLE public.bestellung OWNER TO postgres;

--
-- Name: bestellung_bestellung_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bestellung_bestellung_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bestellung_bestellung_id_seq OWNER TO postgres;

--
-- Name: bestellung_bestellung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bestellung_bestellung_id_seq OWNED BY public.bestellung.bestellung_id;


--
-- Name: bestellung_gericht; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bestellung_gericht (
    bestellung_id integer NOT NULL,
    gericht_id integer NOT NULL,
    anzahl integer DEFAULT 1 NOT NULL,
    einzelpreis numeric(6,2) NOT NULL,
    CONSTRAINT bestellung_gericht_anzahl_check CHECK ((anzahl > 0))
);


ALTER TABLE public.bestellung_gericht OWNER TO postgres;

--
-- Name: fahrer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fahrer (
    fahrer_id integer NOT NULL,
    nachname character varying(50) NOT NULL,
    vorname character varying(50) NOT NULL,
    telefon character varying(20) NOT NULL,
    fahrzeugtyp character varying(30) DEFAULT 'Fahrrad'::character varying NOT NULL,
    verfuegbar boolean DEFAULT true NOT NULL
);


ALTER TABLE public.fahrer OWNER TO postgres;

--
-- Name: fahrer_fahrer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fahrer_fahrer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fahrer_fahrer_id_seq OWNER TO postgres;

--
-- Name: fahrer_fahrer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fahrer_fahrer_id_seq OWNED BY public.fahrer.fahrer_id;


--
-- Name: gericht; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gericht (
    gericht_id integer NOT NULL,
    title character varying(100) NOT NULL,
    beschreibung text,
    preis numeric(6,2) NOT NULL,
    verfuegbar boolean DEFAULT true NOT NULL,
    kategorie_id integer NOT NULL
);


ALTER TABLE public.gericht OWNER TO postgres;

--
-- Name: gericht_gericht_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gericht_gericht_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gericht_gericht_id_seq OWNER TO postgres;

--
-- Name: gericht_gericht_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gericht_gericht_id_seq OWNED BY public.gericht.gericht_id;


--
-- Name: kategorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategorie (
    kategorie_id integer NOT NULL,
    bezeichnung character varying(60) NOT NULL
);


ALTER TABLE public.kategorie OWNER TO postgres;

--
-- Name: kategorie_kategorie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategorie_kategorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kategorie_kategorie_id_seq OWNER TO postgres;

--
-- Name: kategorie_kategorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategorie_kategorie_id_seq OWNED BY public.kategorie.kategorie_id;


--
-- Name: kunde; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kunde (
    kunde_id integer NOT NULL,
    nachname character varying(50) NOT NULL,
    vorname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    telefon character varying(20),
    strasse character varying(100) NOT NULL,
    hausnummer character varying(10) NOT NULL,
    ort_id integer NOT NULL
);


ALTER TABLE public.kunde OWNER TO postgres;

--
-- Name: kunde_kunde_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kunde_kunde_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kunde_kunde_id_seq OWNER TO postgres;

--
-- Name: kunde_kunde_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kunde_kunde_id_seq OWNED BY public.kunde.kunde_id;


--
-- Name: ort; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ort (
    ort_id integer NOT NULL,
    plz character varying(10) NOT NULL,
    stadtname character varying(80) NOT NULL,
    kanton character varying(50) NOT NULL
);


ALTER TABLE public.ort OWNER TO postgres;

--
-- Name: ort_ort_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ort_ort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ort_ort_id_seq OWNER TO postgres;

--
-- Name: ort_ort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ort_ort_id_seq OWNED BY public.ort.ort_id;


--
-- Name: bestellung bestellung_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bestellung ALTER COLUMN bestellung_id SET DEFAULT nextval('public.bestellung_bestellung_id_seq'::regclass);


--
-- Name: fahrer fahrer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fahrer ALTER COLUMN fahrer_id SET DEFAULT nextval('public.fahrer_fahrer_id_seq'::regclass);


--
-- Name: gericht gericht_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gericht ALTER COLUMN gericht_id SET DEFAULT nextval('public.gericht_gericht_id_seq'::regclass);


--
-- Name: kategorie kategorie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategorie ALTER COLUMN kategorie_id SET DEFAULT nextval('public.kategorie_kategorie_id_seq'::regclass);


--
-- Name: kunde kunde_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kunde ALTER COLUMN kunde_id SET DEFAULT nextval('public.kunde_kunde_id_seq'::regclass);


--
-- Name: ort ort_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ort ALTER COLUMN ort_id SET DEFAULT nextval('public.ort_ort_id_seq'::regclass);


--
-- Data for Name: bestellung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bestellung (bestellung_id, kunde_id, fahrer_id, bestelldatum, status, lieferstrasse, lieferhausnummer, liefer_ort_id) FROM stdin;
1	1	1	2026-06-03 19:09:54.132605	geliefert	Bahnhofstrasse	1	1
2	2	2	2026-06-03 19:09:54.132605	geliefert	Langstrasse	45	2
3	3	1	2026-06-03 19:09:54.132605	unterwegs	Seestrasse	12	1
4	1	3	2026-06-03 19:09:54.132605	geliefert	Bahnhofstrasse	1	1
5	4	2	2026-06-03 19:09:54.132605	offen	Rämistrasse	8	3
6	5	\N	2026-06-03 19:09:54.132605	offen	Limmatstrasse	22	2
\.


--
-- Data for Name: bestellung_gericht; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bestellung_gericht (bestellung_id, gericht_id, anzahl, einzelpreis) FROM stdin;
1	1	2	14.50
1	8	1	6.50
2	3	1	13.50
2	7	1	11.50
3	5	2	15.80
3	6	1	14.90
4	2	1	16.90
4	4	1	12.90
4	8	2	6.50
5	1	3	14.50
6	3	1	13.50
6	5	1	15.80
\.


--
-- Data for Name: fahrer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fahrer (fahrer_id, nachname, vorname, telefon, fahrzeugtyp, verfuegbar) FROM stdin;
1	Ferrari	Marco	079 666 66 61	Roller	t
2	Huber	Petra	079 666 66 62	Fahrrad	t
3	Osei	Kwame	079 666 66 63	Roller	t
\.


--
-- Data for Name: gericht; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gericht (gericht_id, title, beschreibung, preis, verfuegbar, kategorie_id) FROM stdin;
1	Margherita	Tomatensauce, Mozzarella	14.50	t	1
2	Pepperoni	Tomatensauce, Mozzarella, Salami	16.90	t	1
3	Chicken Burger	Knusperhähnchen, Salat, Sauce	13.50	t	2
4	Veggie Burger	Gemüsepattie, Avocado, Tomate	12.90	t	2
5	Pad Thai	Reisnudeln, Erdnüsse, Tofu	15.80	t	3
6	Green Curry	Kokosgemüse, Jasminreis	14.90	t	3
7	Caesar Salad	Römersalat, Parmesan, Croutons	11.50	t	4
8	Tiramisu	Mascarpone, Espresso, Savoiardi	6.50	t	5
\.


--
-- Data for Name: kategorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategorie (kategorie_id, bezeichnung) FROM stdin;
1	Pizza
2	Burger
3	Asia
4	Salat
5	Dessert
\.


--
-- Data for Name: kunde; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kunde (kunde_id, nachname, vorname, email, telefon, strasse, hausnummer, ort_id) FROM stdin;
1	Müller	Anna	a.mueller@mail.ch	079 111 11 11	Bahnhofstrasse	1	1
2	Schmid	Jonas	j.schmid@mail.ch	079 222 22 22	Langstrasse	45	2
3	Keller	Sophie	s.keller@mail.ch	079 333 33 33	Seestrasse	12	1
4	Brunner	Lukas	l.brunner@mail.ch	079 444 44 44	Rämistrasse	8	3
5	Weber	Mia	m.weber@mail.ch	079 555 55 55	Limmatstrasse	22	2
\.


--
-- Data for Name: ort; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ort (ort_id, plz, stadtname, kanton) FROM stdin;
1	8001	Zürich	ZH
2	8004	Zürich	ZH
3	8005	Zürich	ZH
4	3001	Bern	BE
5	4051	Basel	BS
\.


--
-- Name: bestellung_bestellung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bestellung_bestellung_id_seq', 6, true);


--
-- Name: fahrer_fahrer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fahrer_fahrer_id_seq', 3, true);


--
-- Name: gericht_gericht_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gericht_gericht_id_seq', 8, true);


--
-- Name: kategorie_kategorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategorie_kategorie_id_seq', 5, true);


--
-- Name: kunde_kunde_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kunde_kunde_id_seq', 5, true);


--
-- Name: ort_ort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ort_ort_id_seq', 5, true);


--
-- Name: bestellung_gericht bestellung_gericht_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bestellung_gericht
    ADD CONSTRAINT bestellung_gericht_pkey PRIMARY KEY (bestellung_id, gericht_id);


--
-- Name: bestellung bestellung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bestellung
    ADD CONSTRAINT bestellung_pkey PRIMARY KEY (bestellung_id);


--
-- Name: fahrer fahrer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fahrer
    ADD CONSTRAINT fahrer_pkey PRIMARY KEY (fahrer_id);


--
-- Name: gericht gericht_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gericht
    ADD CONSTRAINT gericht_pkey PRIMARY KEY (gericht_id);


--
-- Name: kategorie kategorie_bezeichnung_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategorie
    ADD CONSTRAINT kategorie_bezeichnung_key UNIQUE (bezeichnung);


--
-- Name: kategorie kategorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategorie
    ADD CONSTRAINT kategorie_pkey PRIMARY KEY (kategorie_id);


--
-- Name: kunde kunde_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_email_key UNIQUE (email);


--
-- Name: kunde kunde_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_pkey PRIMARY KEY (kunde_id);


--
-- Name: ort ort_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ort
    ADD CONSTRAINT ort_pkey PRIMARY KEY (ort_id);


--
-- Name: bestellung bestellung_fahrer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bestellung
    ADD CONSTRAINT bestellung_fahrer_id_fkey FOREIGN KEY (fahrer_id) REFERENCES public.fahrer(fahrer_id);


--
-- Name: bestellung_gericht bestellung_gericht_bestellung_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bestellung_gericht
    ADD CONSTRAINT bestellung_gericht_bestellung_id_fkey FOREIGN KEY (bestellung_id) REFERENCES public.bestellung(bestellung_id) ON DELETE CASCADE;


--
-- Name: bestellung_gericht bestellung_gericht_gericht_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bestellung_gericht
    ADD CONSTRAINT bestellung_gericht_gericht_id_fkey FOREIGN KEY (gericht_id) REFERENCES public.gericht(gericht_id);


--
-- Name: gericht gericht_kategorie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gericht
    ADD CONSTRAINT gericht_kategorie_id_fkey FOREIGN KEY (kategorie_id) REFERENCES public.kategorie(kategorie_id);


--
-- Name: kunde kunde_ort_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_ort_id_fkey FOREIGN KEY (ort_id) REFERENCES public.ort(ort_id);


--
-- PostgreSQL database dump complete
--

\unrestrict CVp5ej90RowgtqU3A1JtFw7fYcow25uv6W52bHbhyJRVh8UnU2ZZDMMjcz4dmG1

