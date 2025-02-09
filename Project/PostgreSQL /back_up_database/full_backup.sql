--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10 (Debian 15.10-1.pgdg120+1)
-- Dumped by pg_dump version 15.6 (Homebrew)

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
-- Name: langfun(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.langfun(p_id integer) RETURNS integer
    LANGUAGE sql
    AS $$
SELECT COALESCE(LanguageId, 0)
FROM Translator_Competence AS tc
WHERE tc.id = p_id;
$$;


ALTER FUNCTION public.langfun(p_id integer) OWNER TO postgres;

--
-- Name: langfun1(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.langfun1(p_id integer) RETURNS integer
    LANGUAGE sql
    AS $$
SELECT COALESCE (TC.LanguageId, 0)
FROM Task AS T
         INNER JOIN Translator_Competence AS TC ON T.TranslatorCompetenceID = TC.Id
WHERE T.id = p_id;
$$;


ALTER FUNCTION public.langfun1(p_id integer) OWNER TO postgres;

--
-- Name: transfun(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.transfun(p_id integer) RETURNS integer
    LANGUAGE sql
    AS $$
SELECT COALESCE(TranslatorId, 0)
FROM Translator_Competence AS tc
WHERE tc.id = p_id;
$$;


ALTER FUNCTION public.transfun(p_id integer) OWNER TO postgres;

--
-- Name: transfun1(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.transfun1(p_id integer) RETURNS integer
    LANGUAGE sql
    AS $$
SELECT COALESCE (TC.TranslatorId, 0)
FROM Task AS T
         INNER JOIN Translator_Competence AS TC ON T.TranslatorCompetenceID = TC.Id
WHERE T.id = p_id;
$$;


ALTER FUNCTION public.transfun1(p_id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    categoryname character varying(11) NOT NULL,
    oralfee double precision,
    writtenfee double precision,
    phonefee double precision,
    transportcostfee double precision,
    transporttimefee double precision
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    contactname character varying(30),
    login text NOT NULL,
    password text NOT NULL,
    tlf character varying(20),
    cityaddress character varying(30),
    street character varying(50),
    housenr character varying(20),
    feemultiplier double precision
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    id integer NOT NULL,
    nameoflang character varying(20) NOT NULL
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_id_seq OWNER TO postgres;

--
-- Name: language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.language_id_seq OWNED BY public.language.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id integer NOT NULL,
    tasktype character varying(30) NOT NULL,
    dateoftask date NOT NULL,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL,
    urgent integer,
    difficult integer,
    cityaddress character varying(30),
    street character varying(50),
    housenr character varying(20),
    translatorcompetenceid integer,
    clientid integer,
    translatorid integer,
    languageid integer
);


ALTER TABLE public.task OWNER TO postgres;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- Name: task_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_review (
    id integer NOT NULL,
    dateofreview date NOT NULL,
    body text,
    stars integer DEFAULT 0,
    taskid integer,
    clientid integer,
    translatorid integer,
    languageid integer,
    CONSTRAINT task_review_stars_check CHECK (((stars >= 1) AND (stars <= 5)))
);


ALTER TABLE public.task_review OWNER TO postgres;

--
-- Name: task_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_review_id_seq OWNER TO postgres;

--
-- Name: task_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_review_id_seq OWNED BY public.task_review.id;


--
-- Name: translator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translator (
    id integer NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    age integer DEFAULT 18,
    cityaddress character varying(30),
    street character varying(50),
    housenr character varying(20),
    email character varying(50),
    tlf character varying(20),
    education text NOT NULL,
    CONSTRAINT translator_age_check CHECK (((age >= 18) AND (age <= 70)))
);


ALTER TABLE public.translator OWNER TO postgres;

--
-- Name: translator_competence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translator_competence (
    id integer NOT NULL,
    translatorid integer,
    languageid integer,
    categoryid integer
);


ALTER TABLE public.translator_competence OWNER TO postgres;

--
-- Name: translator_competence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translator_competence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translator_competence_id_seq OWNER TO postgres;

--
-- Name: translator_competence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translator_competence_id_seq OWNED BY public.translator_competence.id;


--
-- Name: translator_employment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translator_employment (
    id integer NOT NULL,
    employmentdate date NOT NULL,
    dismissaldate date,
    "position" text NOT NULL,
    companyname text NOT NULL,
    translatorid integer
);


ALTER TABLE public.translator_employment OWNER TO postgres;

--
-- Name: translator_employment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translator_employment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translator_employment_id_seq OWNER TO postgres;

--
-- Name: translator_employment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translator_employment_id_seq OWNED BY public.translator_employment.id;


--
-- Name: translator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translator_id_seq OWNER TO postgres;

--
-- Name: translator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translator_id_seq OWNED BY public.translator.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language ALTER COLUMN id SET DEFAULT nextval('public.language_id_seq'::regclass);


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- Name: task_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_review ALTER COLUMN id SET DEFAULT nextval('public.task_review_id_seq'::regclass);


--
-- Name: translator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator ALTER COLUMN id SET DEFAULT nextval('public.translator_id_seq'::regclass);


--
-- Name: translator_competence id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_competence ALTER COLUMN id SET DEFAULT nextval('public.translator_competence_id_seq'::regclass);


--
-- Name: translator_employment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_employment ALTER COLUMN id SET DEFAULT nextval('public.translator_employment_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES (1, 'Category 1', 410, 4.5, 400, 205, 3.13);
INSERT INTO public.category VALUES (2, 'Category 2', 290, 3.2, 250, 145, 3.13);
INSERT INTO public.category VALUES (3, 'Category 3', 110, 2, 100, 55, 3.13);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client VALUES (1, 'Copenhagen City Court', 'cph_court', 'court123', '20 40 60 80', 'Copenhagen', 'Hovedgaden', '123', 1.2);
INSERT INTO public.client VALUES (2, 'Hilleroed Court', 'hilleroed_court', 'court456', '21 41 61 81', 'Hilleroed', 'Egevej', '456', 1);
INSERT INTO public.client VALUES (3, 'Helsingoer Court', 'helsingoer_court', 'court789', '22 42 62 82', 'Helsingoer', 'Bøgevej', '789', 1.1);
INSERT INTO public.client VALUES (4, 'Roskilde Court', 'roskilde_court', 'courtabc', '23 43 63 83', 'Roskilde', 'Ahornvej', '101', 0.9);
INSERT INTO public.client VALUES (5, 'Landsbyret', 'landsbyret', 'courttuv', '24 44 64 84', 'Copenhagen', 'Borgergade', '1', 1.5);
INSERT INTO public.client VALUES (6, 'Herning Court', 'herning_court', 'courtxyz', '25 45 65 85', 'Herning', 'Elmegade', '303', 1.1);
INSERT INTO public.client VALUES (7, 'Viborg Court', 'viborg_court', 'court123abc', '26 46 66 86', 'Viborg', 'Birkelunden', '404', 1);
INSERT INTO public.client VALUES (8, 'Aalborg Court', 'aalborg_court', 'court456def', '27 47 67 87', 'Aalborg', 'Elmevej', '505', 0.9);
INSERT INTO public.client VALUES (9, 'Naestved Court', 'naestved_court', 'court789ghi', '28 48 68 88', 'Naestved', 'Kastanievej', '601', 1.2);
INSERT INTO public.client VALUES (10, 'Sonderborg Court', 'sonderborg_court', 'courtabcjkl', '29 49 69 89', 'Sonderborg', 'Lindegade', '702', 1.3);
INSERT INTO public.client VALUES (11, 'Copenhagen Police Station', 'cph_police', 'password123', '24 56 78 90', 'Copenhagen', 'Hovedgaden', '123', 0);
INSERT INTO public.client VALUES (12, 'Aarhus Police Station', 'aarhus_police', 'password456', '28 36 54 72', 'Aarhus', 'Egevej', '456', 0);
INSERT INTO public.client VALUES (13, 'Odense Police Station', 'odense_police', 'password789', '23 45 67 89', 'Odense', 'Ahornvej', '789', 0);
INSERT INTO public.client VALUES (14, 'Aalborg Police Station', 'aalborg_police', 'passwordabc', '25 35 47 59', 'Aalborg', 'Elmevej', '101', 0);
INSERT INTO public.client VALUES (15, 'Esbjerg Police Station', 'esbjerg_police', 'passworddef', '27 38 49 50', 'Esbjerg', 'Lindevej', '202', 0);
INSERT INTO public.client VALUES (16, 'Frederiksberg Police Station', 'frederiksberg_police', 'pass456word', '22 33 44 55', 'Frederiksberg', 'Elmevej', '303', 0);
INSERT INTO public.client VALUES (17, 'Horsens Police Station', 'horsens_police', 'pass789word', '26 37 48 59', 'Horsens', 'Fyrstegade', '404', 0.1);
INSERT INTO public.client VALUES (18, 'Randers Police Station', 'randers_police', 'passabcword', '29 39 49 59', 'Randers', 'Grovevej', '505', 0);
INSERT INTO public.client VALUES (19, 'Helsingoer Station', 'cph_central_police', 'passdefword', '21 31 41 51', 'Helsingoer', 'Bøgegade', '10', 0);
INSERT INTO public.client VALUES (20, 'Aarhus Central Police Station', 'aarhus_central_police', 'passxyzword', '23 33 43 53', 'Aarhus', 'Elmegade', '702', 0);
INSERT INTO public.client VALUES (21, 'Immigration Service', 'immigration_service', 'immigration123', '30 50 70 90', 'Naestved', 'Hovedgaden', '789', 0);
INSERT INTO public.client VALUES (22, 'Home Travel Agency', 'home_travel', 'travel456', '31 51 71 91', 'Copenhagen', 'Strandvejen', '123', 0);
INSERT INTO public.client VALUES (23, 'Sophia Larsen', 'sophial', 'password135', '47 57 67 77', 'Copenhagen', 'Rosenvej', '67', 0);
INSERT INTO public.client VALUES (24, 'Frederik Nielsen', 'frederikn', 'password246', '48 58 68 78', 'Aarhus', 'Ahornvej', '89', 0);
INSERT INTO public.client VALUES (25, 'Emma Christensen', 'emmac', 'password357', '49 59 69 79', 'Odense', 'Birkelunden', '10', 0);
INSERT INTO public.client VALUES (26, 'Lucas Jensen', 'lucasj', 'password468', '50 60 70 80', 'Esbjerg', 'Elmegade', '32', 0);
INSERT INTO public.client VALUES (27, 'Maja Pedersen', 'majap', 'password321', '43 53 63 73', 'Aalborg', 'Fyrvej', '78', 0);
INSERT INTO public.client VALUES (28, 'Nikolaj Rasmussen', 'nikolajr', 'password654', '44 54 64 74', 'Esbjerg', 'Bøgevej', '90', 1);
INSERT INTO public.client VALUES (29, 'Laura Andersen', 'lauraa', 'password987', '45 55 65 75', 'Horsens', 'Lærkevej', '23', 0);
INSERT INTO public.client VALUES (30, 'Oliver Madsen', 'oliverm', 'password246', '46 56 66 76', 'Randers', 'Kastanievej', '45', 0.9);
INSERT INTO public.client VALUES (31, 'Lars Jensen', 'larsj', 'password123', '40 50 60 70', 'Copenhagen', 'Elmegade', '12', 0);
INSERT INTO public.client VALUES (32, 'Emma Nielsen', 'emman', 'password456', '41 51 61 71', 'Aarhus', 'Birkevej', '34', 0.9);
INSERT INTO public.client VALUES (33, 'Sofie Hansen', 'sofieh', 'password789', '42 52 62 72', 'Odense', 'Ahornvej', '56', 0);


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.language VALUES (1, 'English');
INSERT INTO public.language VALUES (2, 'Spanish');
INSERT INTO public.language VALUES (3, 'French');
INSERT INTO public.language VALUES (4, 'German');
INSERT INTO public.language VALUES (5, 'Mandarin');
INSERT INTO public.language VALUES (6, 'Arabic');
INSERT INTO public.language VALUES (7, 'Portuguese');
INSERT INTO public.language VALUES (8, 'Russian');
INSERT INTO public.language VALUES (9, 'Italian');
INSERT INTO public.language VALUES (10, 'Dutch');
INSERT INTO public.language VALUES (11, 'Swedish');
INSERT INTO public.language VALUES (12, 'Norwegian');
INSERT INTO public.language VALUES (13, 'Finnish');
INSERT INTO public.language VALUES (14, 'Danish');
INSERT INTO public.language VALUES (15, 'Greek');
INSERT INTO public.language VALUES (16, 'Turkish');
INSERT INTO public.language VALUES (17, 'Japanese');
INSERT INTO public.language VALUES (18, 'Korean');
INSERT INTO public.language VALUES (19, 'Thai');
INSERT INTO public.language VALUES (20, 'Vietnamese');
INSERT INTO public.language VALUES (21, 'Hindi');
INSERT INTO public.language VALUES (22, 'Bengali');
INSERT INTO public.language VALUES (23, 'Urdu');
INSERT INTO public.language VALUES (24, 'Punjabi');
INSERT INTO public.language VALUES (25, 'Persian');
INSERT INTO public.language VALUES (26, 'Indonesian');
INSERT INTO public.language VALUES (27, 'Malay');
INSERT INTO public.language VALUES (28, 'Filipino');
INSERT INTO public.language VALUES (29, 'Swahili');
INSERT INTO public.language VALUES (30, 'Czech');
INSERT INTO public.language VALUES (31, 'Polish');


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.task VALUES (1, 'Oral Interpretation', '2020-05-10', '10:00:00', '12:00:00', 0, 0, 'Copenhagen', 'Hovedgaden', '123', 1, 10, 1, 1);
INSERT INTO public.task VALUES (2, 'Oral Interpretation', '2022-09-11', '14:00:00', '16:00:00', 1, 1, 'Hilleroed', 'Egevej', '456', 4, 2, 2, 15);
INSERT INTO public.task VALUES (3, 'Oral Interpretation', '2020-12-12', '09:00:00', '11:00:00', 0, 1, 'Helsingoer', 'Bøgevej', '789', 7, 3, 3, 4);
INSERT INTO public.task VALUES (4, 'Phone Translation', '2022-11-01', '17:00:00', '19:00:00', 0, 1, 'Roskilde', 'Ahornvej', '101', 14, 4, 5, 8);
INSERT INTO public.task VALUES (5, 'Oral Interpretation', '2021-01-14', '14:00:00', '15:30:00', 1, 1, 'Copenhagen', 'Borgergade', '1', 3, 5, 1, 3);
INSERT INTO public.task VALUES (6, 'Written Translation', '2021-02-15', '06:00:00', '23:00:00', 0, 0, 'Viborg', 'Birkelunden', '404', 18, 7, 6, 4);
INSERT INTO public.task VALUES (7, 'Oral Interpretation', '2021-03-02', '09:00:00', '17:00:00', 0, 1, 'Aalborg', 'Elmevej', '505', 22, 8, 8, 8);
INSERT INTO public.task VALUES (8, 'Oral Interpretation', '2021-05-17', '14:00:00', '18:00:00', 1, 1, 'Aarhus', 'Egevej', '456', 24, 10, 8, 4);
INSERT INTO public.task VALUES (9, 'Phone Translation', '2022-06-18', '10:00:00', '12:00:00', 0, 0, 'Esbjerg', 'Lindevej', '202', 28, 12, 10, 8);
INSERT INTO public.task VALUES (10, 'Phone Translation', '2020-06-19', '13:00:00', '15:00:00', 1, 0, 'Randers', 'Grovevej', '505', 29, 14, 10, 4);
INSERT INTO public.task VALUES (11, 'Phone Translation', '2021-07-20', '16:00:00', '18:00:00', 0, 0, 'Horsens', 'Fyrstegade', '404', 32, 1, 11, 4);
INSERT INTO public.task VALUES (12, 'Written Translation', '2020-01-21', '07:00:00', '21:00:00', 0, 1, 'Copenhagen', 'Rosenvej', '67', 40, 20, 14, 8);
INSERT INTO public.task VALUES (13, 'Written Translation', '2021-02-22', '07:00:00', '23:00:00', 1, 0, 'Aarhus', 'Ahornvej', '89', 41, 21, 14, 4);
INSERT INTO public.task VALUES (15, 'Phone Translation', '2022-12-26', '08:00:00', '10:00:00', 0, 0, 'Esbjerg', 'Elmegade', '32', 9, 23, 3, 6);
INSERT INTO public.task VALUES (16, 'Oral Interpretation', '2021-07-25', '12:00:00', '18:00:00', 1, 1, 'Aalborg', 'Fyrvej', '78', 46, 24, 16, 1);
INSERT INTO public.task VALUES (17, 'Oral Interpretation', '2023-04-11', '12:00:00', '18:00:00', 0, 0, 'Esbjerg', 'Bøgevej', '90', 2, 25, 1, 2);
INSERT INTO public.task VALUES (18, 'Phone Translation', '2023-02-04', '11:00:00', '14:00:00', 0, 0, 'Horsens', 'Lærkevej', '23', 47, 26, 16, 4);
INSERT INTO public.task VALUES (19, 'Written Translation', '2020-02-04', '06:00:00', '23:00:00', 1, 0, 'Randers', 'Kastanievej', '45', 48, 27, 16, 8);
INSERT INTO public.task VALUES (20, 'Written Translation', '2021-08-15', '06:00:00', '23:00:00', 0, 0, 'Copenhagen', 'Elmegade', '12', 49, 28, 17, 4);
INSERT INTO public.task VALUES (21, 'Phone Translation', '2023-01-12', '15:00:00', '19:00:00', 0, 0, 'Aarhus', 'Birkevej', '34', 30, 29, 10, 22);
INSERT INTO public.task VALUES (22, 'Oral Interpretation', '2020-09-18', '10:00:00', '16:00:00', 0, 0, 'Odense', 'Ahornvej', '56', 24, 30, 8, 4);
INSERT INTO public.task VALUES (23, 'Phone Translation', '2020-10-12', '10:00:00', '12:00:00', 0, 0, 'Copenhagen', 'Strandvejen', '123', 29, 22, 10, 4);
INSERT INTO public.task VALUES (24, 'Oral Interpretation', '2021-02-12', '10:00:00', '15:00:00', 0, 1, 'Copenhagen', 'Strandvejen', '123', 51, 22, 17, 8);
INSERT INTO public.task VALUES (25, 'Oral Interpretation', '2023-02-27', '09:00:00', '17:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 52, 21, 18, 4);
INSERT INTO public.task VALUES (26, 'Oral Interpretation', '2022-08-03', '09:00:00', '16:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 53, 21, 18, 2);
INSERT INTO public.task VALUES (27, 'Oral Interpretation', '2022-11-08', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 11, 21, 4, 11);
INSERT INTO public.task VALUES (28, 'Oral Interpretation', '2022-07-08', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 55, 21, 19, 1);
INSERT INTO public.task VALUES (29, 'Oral Interpretation', '2023-05-08', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 57, 21, 19, 8);
INSERT INTO public.task VALUES (30, 'Oral Interpretation', '2022-03-18', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 58, 21, 20, 4);
INSERT INTO public.task VALUES (31, 'Oral Interpretation', '2021-05-12', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 8, 21, 3, 2);
INSERT INTO public.task VALUES (32, 'Written Translation', '2021-09-22', '06:00:00', '23:00:00', 1, 0, 'Frederiksberg', 'Elmevej', '303', 15, 6, 5, 15);
INSERT INTO public.task VALUES (33, 'Written Translation', '2022-06-20', '06:00:00', '23:00:00', 0, 0, 'Naestved', 'Kastanievej', '601', 32, 9, 11, 4);
INSERT INTO public.task VALUES (34, 'Written Translation', '2022-10-11', '06:00:00', '23:00:00', 0, 0, 'Odense', 'Ahornvej', '789', 7, 13, 3, 4);
INSERT INTO public.task VALUES (35, 'Written Translation', '2023-01-04', '06:00:00', '23:00:00', 1, 0, 'Esbjerg', 'Lindevej', '202', 1, 15, 1, 1);
INSERT INTO public.task VALUES (36, 'Oral Interpretation', '2023-02-27', '09:00:00', '17:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 52, 22, 18, 4);
INSERT INTO public.task VALUES (37, 'Oral Interpretation', '2022-08-03', '09:00:00', '16:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 53, 22, 18, 2);
INSERT INTO public.task VALUES (38, 'Oral Interpretation', '2022-11-08', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 11, 22, 4, 11);
INSERT INTO public.task VALUES (39, 'Oral Interpretation', '2022-07-08', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 55, 22, 19, 1);
INSERT INTO public.task VALUES (40, 'Oral Interpretation', '2023-05-08', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 57, 22, 19, 8);
INSERT INTO public.task VALUES (41, 'Oral Interpretation', '2022-03-18', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 58, 22, 20, 4);
INSERT INTO public.task VALUES (42, 'Oral Interpretation', '2021-05-12', '09:00:00', '15:00:00', 0, 0, 'Naestved', 'Hovedgaden', '789', 8, 22, 3, 2);
INSERT INTO public.task VALUES (43, 'Written Translation', '2021-09-22', '06:00:00', '23:00:00', 1, 0, 'Frederiksberg', 'Elmevej', '303', 15, 22, 5, 15);
INSERT INTO public.task VALUES (44, 'Written Translation', '2022-06-20', '06:00:00', '23:00:00', 0, 0, 'Naestved', 'Kastanievej', '601', 32, 22, 11, 4);
INSERT INTO public.task VALUES (45, 'Written Translation', '2022-10-11', '06:00:00', '23:00:00', 0, 0, 'Odense', 'Ahornvej', '789', 7, 22, 3, 4);
INSERT INTO public.task VALUES (46, 'Written Translation', '2023-01-04', '06:00:00', '23:00:00', 1, 0, 'Esbjerg', 'Lindevej', '202', 1, 22, 1, 1);
INSERT INTO public.task VALUES (48, 'oral', '2024-06-07', '14:02:11', '15:02:11', 0, 1, 'Roskilde', 'Liljegade', '84', 28, 22, 10, 8);
INSERT INTO public.task VALUES (49, 'oral', '2024-06-08', '14:02:12', '16:20:00', 1, 0, 'Sønderrupsønder', 'Landevej', '65', 30, 22, 10, 22);


--
-- Data for Name: task_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.task_review VALUES (1, '2020-05-22', 'Fremragende arbejde!', 5, 1, 1, 1, 1);
INSERT INTO public.task_review VALUES (2, '2022-10-23', 'Fantastisk tolkning!', 5, 2, 2, 2, 15);
INSERT INTO public.task_review VALUES (3, '2021-03-24', 'Meget tilfredsstillende oversættelse.', 4, 6, 3, 6, 4);
INSERT INTO public.task_review VALUES (4, '2021-01-10', 'God telefontolkning.', 4, 4, 4, 5, 8);
INSERT INTO public.task_review VALUES (5, '2021-01-26', 'Ikke tilfreds med tidsstyring. Opfylde opgaven for sent.', 2, 5, 5, 1, 3);
INSERT INTO public.task_review VALUES (6, '2021-02-27', 'Fantastisk arbejde! Meget imponeret.', 5, 3, 6, 3, 4);
INSERT INTO public.task_review VALUES (7, '2021-03-15', 'Udmærket tolkning.', 3, 7, 7, 8, 8);
INSERT INTO public.task_review VALUES (8, '2021-05-29', 'Flot oversættelse.', 4, 8, 8, 8, 4);
INSERT INTO public.task_review VALUES (9, '2022-06-30', 'Meget god telefontolkning.', 4, 9, 9, 10, 8);
INSERT INTO public.task_review VALUES (10, '2020-06-22', 'Manglede færdiggørelsen af opgaven til tiden.', 2, 10, 10, 10, 4);
INSERT INTO public.task_review VALUES (11, '2021-07-26', 'Udmærket arbejde.', 3, 11, 11, 11, 4);
INSERT INTO public.task_review VALUES (12, '2020-02-02', 'God oversættelse.', 4, 12, 12, 14, 8);
INSERT INTO public.task_review VALUES (13, '2021-03-03', 'Udmærket tolkning.', 3, 13, 13, 14, 4);
INSERT INTO public.task_review VALUES (14, '2022-12-04', 'Fremragende arbejde! Vældig tilfreds.', 5, 17, 14, 1, 2);
INSERT INTO public.task_review VALUES (15, '2022-12-28', 'Fantastisk oversættelse!', 5, 15, 15, 3, 6);
INSERT INTO public.task_review VALUES (16, '2023-02-06', 'Tilfredsstillende telefontolkning.', 4, 21, 16, 10, 22);
INSERT INTO public.task_review VALUES (18, '2023-02-08', 'Godt udført arbejde. Kan godt finde på at bestille samme tolk igen.', 4, 18, 18, 16, 4);
INSERT INTO public.task_review VALUES (19, '2020-02-09', 'Meget tilfreds med oversættelsen. Udført til tiden.', 4, 19, 19, 16, 8);
INSERT INTO public.task_review VALUES (20, '2021-08-20', 'Udmærket tolkning.', 3, 20, 20, 17, 4);
INSERT INTO public.task_review VALUES (21, '2023-01-15', 'Fantastisk arbejde! Kan varmt anbefales. Dygtig tolk.', 5, 31, 31, 3, 2);
INSERT INTO public.task_review VALUES (22, '2021-09-28', 'God oversættelse.', 4, 32, 32, 5, 15);
INSERT INTO public.task_review VALUES (23, '2022-06-23', 'Ikke særlig god oversættelse: tolken har lavet flere fejl med juridiske termer.', 1, 33, 33, 11, 4);
INSERT INTO public.task_review VALUES (24, '2022-10-24', 'Meget tilfreds med oversættelsen.', 5, 34, 20, 3, 4);
INSERT INTO public.task_review VALUES (25, '2023-01-25', 'Fantastisk oversættelse!', 5, 35, 12, 1, 1);


--
-- Data for Name: translator; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.translator VALUES (1, 'Anni', 'Hansen', 25, 'Copenhagen', 'Vigerslev Alle', '123', 'annihansen@gmail.com', '3012 1843', 'Secondary School');
INSERT INTO public.translator VALUES (2, 'Jane', 'Smith', 30, 'Aarhus', 'Hilleroedgade', '15', 'janesmith@gmail.com', '3012 1844', 'BA of Humanities');
INSERT INTO public.translator VALUES (3, 'David', 'Andersen', 35, 'Odense', 'Fengersvej', '10', 'davidandersen@gmail.com', '3012 1845', 'MA of Humanities');
INSERT INTO public.translator VALUES (4, 'Lars', 'Hansen', 59, 'Aalborg', 'Scharlingsvej', '1', 'larshansen@gmail.com', '3012 1846', 'PhD');
INSERT INTO public.translator VALUES (5, 'Mette', 'Nielsen', 68, 'Esbjerg', 'Ramsingsvej', '202', 'mettenielsen@gmail.com', '3012 1847', 'Secondary School');
INSERT INTO public.translator VALUES (6, 'Anders', 'Pedersen', 42, 'Frederiksberg', 'Tove Maes Vej', '65', 'anderspedersen@gmail.com', '3012 1848', 'BA of Humanities');
INSERT INTO public.translator VALUES (7, 'Charlotte', 'Jensen', 39, 'Horsens', 'Lyshoej Alle', '60', 'charlottejensen@gmail.com', '3012 1849', 'MA of Humanities');
INSERT INTO public.translator VALUES (8, 'Erik', 'Mortensen', 45, 'Randers', 'Jagtvej', '196', 'erikmortensen@gmail.com', '3012 1850', 'PhD');
INSERT INTO public.translator VALUES (9, 'Ahmed', 'Khalid', 31, 'Copenhagen', 'Bøgegade', '601', 'ahmedkhalid@gmail.com', '4512 1851', 'Secondary School');
INSERT INTO public.translator VALUES (10, 'Fatima', 'Ali', 45, 'Aarhus', 'Elmegade', '702', 'fatimaali@gmail.com', '3012 1852', 'BA of Humanities');
INSERT INTO public.translator VALUES (11, 'Mohammed', 'Hassan', 56, 'Odense', 'Ahornvej', '803', 'mohammedhassan@gmail.com', '3112 1853', 'MA of Humanities');
INSERT INTO public.translator VALUES (12, 'Aisha', 'Abdullah', 29, 'Esbjerg', 'Lindevej', '904', 'aishaabdullah@gmail.com', '3012 1854', 'PhD');
INSERT INTO public.translator VALUES (13, 'Youssef', 'Saeed', 36, 'Copenhagen', 'Egevej', '1005', 'youssefsaeed@gmail.com', '3312 1855', 'Secondary School');
INSERT INTO public.translator VALUES (14, 'Ivan', 'Sokolov', 33, 'Copenhagen', 'Bøgevej', '601', 'ivansokolov@gmail.com', '3012 1856', 'Secondary School');
INSERT INTO public.translator VALUES (15, 'Elena', 'Popova', 28, 'Aarhus', 'Elmevej', '702', 'elenapopova@gmail.com', '3812 1857', 'BA of Humanities');
INSERT INTO public.translator VALUES (16, 'Sergei', 'Ivanov', 36, 'Odense', 'Ahornvej', '803', 'sergeiivanov@gmail.com', '3912 1858', 'MA of Humanities');
INSERT INTO public.translator VALUES (17, 'Natalia', 'Smirnova', 31, 'Esbjerg', 'Lindetræsvej', '904', 'nataliasmirnova@gmail.com', '4012 1859', 'PhD');
INSERT INTO public.translator VALUES (18, 'Dmitri', 'Kuznetsov', 67, 'Copenhagen', 'Egevej', '1005', 'dmitrikuznetsov@gmail.com', '6012 1860', 'Secondary School');
INSERT INTO public.translator VALUES (19, 'Helga', 'Ibsen', 41, 'Copenhagen', 'Lundtoftegade', '83', 'helgaibsen@gmail.com', '6033 1860', 'BA of Humanities');
INSERT INTO public.translator VALUES (20, 'Senta', 'Abrahamsen', 65, 'Hellerup', 'Mosevej', '102', 'sentaabrahamsen@gmail.com', '3412 2260', 'Secondary School');


--
-- Data for Name: translator_competence; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.translator_competence VALUES (1, 1, 1, 1);
INSERT INTO public.translator_competence VALUES (2, 1, 2, 1);
INSERT INTO public.translator_competence VALUES (3, 1, 3, 1);
INSERT INTO public.translator_competence VALUES (4, 2, 15, 2);
INSERT INTO public.translator_competence VALUES (5, 2, 16, 2);
INSERT INTO public.translator_competence VALUES (6, 2, 31, 2);
INSERT INTO public.translator_competence VALUES (7, 3, 4, 3);
INSERT INTO public.translator_competence VALUES (8, 3, 2, 2);
INSERT INTO public.translator_competence VALUES (9, 3, 6, 3);
INSERT INTO public.translator_competence VALUES (10, 4, 10, 1);
INSERT INTO public.translator_competence VALUES (11, 4, 11, 3);
INSERT INTO public.translator_competence VALUES (12, 4, 12, 2);
INSERT INTO public.translator_competence VALUES (13, 5, 13, 1);
INSERT INTO public.translator_competence VALUES (14, 5, 8, 2);
INSERT INTO public.translator_competence VALUES (15, 5, 15, 1);
INSERT INTO public.translator_competence VALUES (16, 6, 16, 3);
INSERT INTO public.translator_competence VALUES (17, 6, 17, 2);
INSERT INTO public.translator_competence VALUES (18, 6, 4, 3);
INSERT INTO public.translator_competence VALUES (19, 7, 9, 1);
INSERT INTO public.translator_competence VALUES (20, 7, 7, 1);
INSERT INTO public.translator_competence VALUES (21, 7, 5, 1);
INSERT INTO public.translator_competence VALUES (22, 8, 8, 2);
INSERT INTO public.translator_competence VALUES (23, 8, 19, 2);
INSERT INTO public.translator_competence VALUES (24, 8, 4, 3);
INSERT INTO public.translator_competence VALUES (25, 9, 20, 3);
INSERT INTO public.translator_competence VALUES (26, 9, 21, 3);
INSERT INTO public.translator_competence VALUES (27, 9, 30, 3);
INSERT INTO public.translator_competence VALUES (28, 10, 8, 1);
INSERT INTO public.translator_competence VALUES (29, 10, 4, 3);
INSERT INTO public.translator_competence VALUES (30, 10, 22, 3);
INSERT INTO public.translator_competence VALUES (31, 11, 23, 2);
INSERT INTO public.translator_competence VALUES (32, 11, 4, 2);
INSERT INTO public.translator_competence VALUES (33, 11, 25, 2);
INSERT INTO public.translator_competence VALUES (34, 12, 26, 3);
INSERT INTO public.translator_competence VALUES (35, 12, 2, 3);
INSERT INTO public.translator_competence VALUES (36, 12, 3, 3);
INSERT INTO public.translator_competence VALUES (37, 13, 26, 1);
INSERT INTO public.translator_competence VALUES (38, 13, 7, 1);
INSERT INTO public.translator_competence VALUES (39, 13, 9, 1);
INSERT INTO public.translator_competence VALUES (40, 14, 8, 2);
INSERT INTO public.translator_competence VALUES (41, 14, 4, 2);
INSERT INTO public.translator_competence VALUES (42, 14, 2, 2);
INSERT INTO public.translator_competence VALUES (43, 15, 18, 3);
INSERT INTO public.translator_competence VALUES (44, 15, 1, 3);
INSERT INTO public.translator_competence VALUES (45, 15, 5, 3);
INSERT INTO public.translator_competence VALUES (46, 16, 1, 1);
INSERT INTO public.translator_competence VALUES (47, 16, 4, 1);
INSERT INTO public.translator_competence VALUES (48, 16, 8, 3);
INSERT INTO public.translator_competence VALUES (49, 17, 4, 2);
INSERT INTO public.translator_competence VALUES (50, 17, 13, 2);
INSERT INTO public.translator_competence VALUES (51, 17, 8, 3);
INSERT INTO public.translator_competence VALUES (52, 18, 4, 3);
INSERT INTO public.translator_competence VALUES (53, 18, 2, 3);
INSERT INTO public.translator_competence VALUES (54, 18, 3, 3);
INSERT INTO public.translator_competence VALUES (55, 19, 1, 1);
INSERT INTO public.translator_competence VALUES (56, 19, 3, 1);
INSERT INTO public.translator_competence VALUES (57, 19, 8, 3);
INSERT INTO public.translator_competence VALUES (58, 20, 4, 2);
INSERT INTO public.translator_competence VALUES (59, 20, 2, 2);
INSERT INTO public.translator_competence VALUES (60, 20, 3, 3);


--
-- Data for Name: translator_employment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.translator_employment VALUES (1, '2002-03-15', '2004-06-30', 'Tolk og oversætter', 'Dansk Translations', 1);
INSERT INTO public.translator_employment VALUES (2, '2005-07-01', '2011-01-01', 'Oversætter', 'Sprogcentret', 2);
INSERT INTO public.translator_employment VALUES (3, '2010-02-15', '2014-06-15', 'Tolk og oversætter', 'Language Solutions', 3);
INSERT INTO public.translator_employment VALUES (4, '1997-01-01', '2002-01-01', 'Tolk', 'Translatørhuset', 4);
INSERT INTO public.translator_employment VALUES (5, '2001-06-10', '2007-06-10', 'Oversætter', 'Oversættelsesbureauet', 5);
INSERT INTO public.translator_employment VALUES (6, '2005-01-01', '2008-01-01', 'Tolk og oversætter', 'Sprogbroen', 6);
INSERT INTO public.translator_employment VALUES (7, '2000-09-01', '2005-09-01', 'Tolk', 'Global Language Services', 7);
INSERT INTO public.translator_employment VALUES (8, '2001-01-01', '2008-01-01', 'Oversætter', 'Polyglot Translations', 8);
INSERT INTO public.translator_employment VALUES (9, '2003-08-15', '2005-02-15', 'Tolk og oversætter', 'Linguistica', 9);
INSERT INTO public.translator_employment VALUES (10, '1996-02-01', '1998-02-01', 'Tolk', 'Interlang', 10);
INSERT INTO public.translator_employment VALUES (11, '2013-04-15', '2014-03-01', 'Oversætter', 'Interlang', 11);
INSERT INTO public.translator_employment VALUES (12, '1996-01-01', '2007-12-01', 'Tolk og oversætter', 'ProLingo', 12);
INSERT INTO public.translator_employment VALUES (13, '1998-05-10', '2001-05-01', 'Oversætter', 'TransWorld', 13);
INSERT INTO public.translator_employment VALUES (14, '1997-01-01', '2005-01-01', 'Tolk og oversætter', 'Globale Kommunikation', 14);
INSERT INTO public.translator_employment VALUES (15, '1996-01-15', '2006-08-10', 'Tolk', 'TransNation', 15);
INSERT INTO public.translator_employment VALUES (16, '2002-01-01', '2011-12-01', 'Oversætter', 'LingoMasters', 16);
INSERT INTO public.translator_employment VALUES (17, '2005-09-01', '2006-08-01', 'Tolk og oversætter', 'EuroLingua', 17);
INSERT INTO public.translator_employment VALUES (18, '2007-02-01', '2010-01-01', 'Oversætter', 'Interpret Solutions', 18);
INSERT INTO public.translator_employment VALUES (19, '2010-06-15', '2012-01-01', 'Tolk', 'Language Link', 19);
INSERT INTO public.translator_employment VALUES (20, '1996-01-01', '1999-12-15', 'Tolk og oversætter', 'MultiLingual', 20);
INSERT INTO public.translator_employment VALUES (21, '2006-01-15', '2009-12-31', 'Tolk og oversætter', 'Sprogcentret', 1);
INSERT INTO public.translator_employment VALUES (22, '2011-02-01', '2013-06-01', 'Oversætter', 'Dansk Translations', 2);
INSERT INTO public.translator_employment VALUES (23, '2014-06-15', '2016-01-15', 'Tolk og oversætter', 'Translatørhuset', 3);
INSERT INTO public.translator_employment VALUES (24, '2003-01-01', '2005-01-01', 'Tolk', 'Language Solutions', 4);
INSERT INTO public.translator_employment VALUES (25, '2008-06-10', '2010-06-10', 'Oversætter', 'Sprogbroen', 5);
INSERT INTO public.translator_employment VALUES (26, '2009-01-01', '2011-01-01', 'Tolk og oversætter', 'Translatørhuset', 6);
INSERT INTO public.translator_employment VALUES (27, '2006-09-01', '2010-09-01', 'Tolk', 'Sprogbroen', 7);
INSERT INTO public.translator_employment VALUES (28, '2009-01-01', '2010-01-01', 'Oversætter', 'Global Language Services', 8);
INSERT INTO public.translator_employment VALUES (29, '2005-08-15', '2008-05-15', 'Tolk og oversætter', 'LingoMasters', 9);
INSERT INTO public.translator_employment VALUES (30, '2001-02-01', '2009-01-01', 'Tolk', 'TransWorld', 10);
INSERT INTO public.translator_employment VALUES (31, '2014-04-15', '2015-04-01', 'Oversætter', 'Language Link', 11);
INSERT INTO public.translator_employment VALUES (32, '2008-01-01', '2011-12-01', 'Tolk og oversætter', 'TransWorld', 12);
INSERT INTO public.translator_employment VALUES (33, '2001-05-10', '2006-05-05', 'Oversætter', 'EuroLingua', 13);
INSERT INTO public.translator_employment VALUES (34, '2005-01-01', '2009-12-01', 'Tolk og oversætter', 'Sprogbroen', 14);
INSERT INTO public.translator_employment VALUES (35, '2006-08-15', '2011-08-10', 'Tolk', 'LingoMasters', 15);
INSERT INTO public.translator_employment VALUES (36, '2012-01-01', '2016-12-01', 'Oversætter', 'Language Link', 16);
INSERT INTO public.translator_employment VALUES (37, '2006-09-01', '2007-08-01', 'Tolk og oversætter', 'MultiLingual', 17);
INSERT INTO public.translator_employment VALUES (38, '2010-02-01', '2012-01-01', 'Oversætter', 'Language Solutions', 18);
INSERT INTO public.translator_employment VALUES (39, '2012-01-15', '2012-07-10', 'Tolk', 'TransWorld', 19);
INSERT INTO public.translator_employment VALUES (40, '2000-01-01', '2009-12-01', 'Tolk og oversætter', 'Dansk Translations', 20);
INSERT INTO public.translator_employment VALUES (41, '2010-03-15', '2012-06-30', 'Tolk og oversætter', 'Dansk Translations', 1);
INSERT INTO public.translator_employment VALUES (42, '2013-07-01', '2017-05-01', 'Oversætter', 'Sprogcentret', 2);
INSERT INTO public.translator_employment VALUES (43, '2017-02-15', '2019-02-15', 'Tolk og oversætter', 'Language Solutions', 3);
INSERT INTO public.translator_employment VALUES (44, '2012-01-01', '2019-01-01', 'Tolk', 'Translatørhuset', 4);
INSERT INTO public.translator_employment VALUES (45, '2015-06-10', '2019-06-10', 'Oversætter', 'Sprogbroen', 5);
INSERT INTO public.translator_employment VALUES (46, '2015-01-01', '2019-01-01', 'Tolk og oversætter', 'Translatørhuset', 6);
INSERT INTO public.translator_employment VALUES (47, '2015-09-01', '2020-09-01', 'Tolk', 'Sprogbroen', 7);
INSERT INTO public.translator_employment VALUES (48, '2016-01-01', '2021-01-01', 'Oversætter', 'Global Language Services', 8);
INSERT INTO public.translator_employment VALUES (49, '2016-08-15', '2022-03-15', 'Tolk og oversætter', 'LingoMasters', 9);
INSERT INTO public.translator_employment VALUES (50, '2014-02-01', '2019-02-01', 'Tolk', 'TransWorld', 10);
INSERT INTO public.translator_employment VALUES (51, '2018-04-15', '2020-04-01', 'Oversætter', 'Language Link', 11);
INSERT INTO public.translator_employment VALUES (52, '2018-01-01', '2020-12-01', 'Tolk og oversætter', 'TransWorld', 12);
INSERT INTO public.translator_employment VALUES (53, '2013-05-10', '2022-05-05', 'Oversætter', 'EuroLingua', 13);
INSERT INTO public.translator_employment VALUES (54, '2017-01-01', '2020-12-01', 'Tolk og oversætter', 'Sprogbroen', 14);
INSERT INTO public.translator_employment VALUES (55, '2014-08-15', '2020-08-10', 'Tolk', 'LingoMasters', 15);
INSERT INTO public.translator_employment VALUES (56, '2019-01-01', '2022-12-01', 'Oversætter', 'Language Link', 16);
INSERT INTO public.translator_employment VALUES (57, '2009-09-01', '2022-08-01', 'Tolk og oversætter', 'MultiLingual', 17);
INSERT INTO public.translator_employment VALUES (58, '2014-02-01', '2021-01-01', 'Oversætter', 'Language Solutions', 18);
INSERT INTO public.translator_employment VALUES (59, '2016-07-15', '2020-07-14', 'Tolk', 'TransWorld', 19);
INSERT INTO public.translator_employment VALUES (60, '2015-01-01', '2020-02-25', 'Tolk og oversætter', 'Dansk Translations', 20);
INSERT INTO public.translator_employment VALUES (61, '2021-03-15', NULL, 'Tolk og oversætter', 'Easy Translate', 1);
INSERT INTO public.translator_employment VALUES (62, '2021-07-01', NULL, 'Oversætter', 'Easy Translate', 2);
INSERT INTO public.translator_employment VALUES (63, '2020-02-15', NULL, 'Tolk og oversætter', 'Easy Translate', 3);
INSERT INTO public.translator_employment VALUES (64, '2020-01-01', NULL, 'Tolk', 'Easy Translate', 4);
INSERT INTO public.translator_employment VALUES (65, '2020-06-10', NULL, 'Oversætter', 'Easy Translate', 5);
INSERT INTO public.translator_employment VALUES (66, '2020-01-01', NULL, 'Tolk og oversætter', 'Easy Translate', 6);
INSERT INTO public.translator_employment VALUES (67, '2021-09-01', NULL, 'Tolk', 'Easy Translate', 7);
INSERT INTO public.translator_employment VALUES (68, '2022-01-01', NULL, 'Oversætter', 'Easy Translate', 8);
INSERT INTO public.translator_employment VALUES (69, '2023-03-15', NULL, 'Tolk og oversætter', 'Easy Translate', 9);
INSERT INTO public.translator_employment VALUES (70, '2020-02-01', NULL, 'Tolk', 'Easy Translate', 10);
INSERT INTO public.translator_employment VALUES (71, '2020-04-15', NULL, 'Oversætter', 'Easy Translate', 11);
INSERT INTO public.translator_employment VALUES (72, '2021-01-01', NULL, 'Tolk og oversætter', 'Easy Translate', 12);
INSERT INTO public.translator_employment VALUES (73, '2022-05-10', NULL, 'Oversætter', 'Easy Translate', 13);
INSERT INTO public.translator_employment VALUES (74, '2021-01-01', NULL, 'Tolk og oversætter', 'Easy Translate', 14);
INSERT INTO public.translator_employment VALUES (75, '2020-08-15', NULL, 'Tolk', 'Easy Translate', 15);
INSERT INTO public.translator_employment VALUES (76, '2023-01-01', NULL, 'Oversætter', 'Easy Translate', 16);
INSERT INTO public.translator_employment VALUES (77, '2022-09-01', NULL, 'Tolk og oversætter', 'Easy Translate', 17);
INSERT INTO public.translator_employment VALUES (78, '2021-02-01', NULL, 'Oversætter', 'Easy Translate', 18);
INSERT INTO public.translator_employment VALUES (79, '2020-07-15', NULL, 'Tolk', 'Easy Translate', 19);
INSERT INTO public.translator_employment VALUES (80, '2020-03-01', NULL, 'Tolk og oversætter', 'Easy Translate', 20);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_id_seq', 1, false);


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 50, true);


--
-- Name: task_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_review_id_seq', 1, false);


--
-- Name: translator_competence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translator_competence_id_seq', 1, false);


--
-- Name: translator_employment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translator_employment_id_seq', 1, false);


--
-- Name: translator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translator_id_seq', 20, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: client client_tlf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_tlf_key UNIQUE (tlf);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: task_review task_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_review
    ADD CONSTRAINT task_review_pkey PRIMARY KEY (id);


--
-- Name: translator_competence translator_competence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_competence
    ADD CONSTRAINT translator_competence_pkey PRIMARY KEY (id);


--
-- Name: translator translator_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator
    ADD CONSTRAINT translator_email_key UNIQUE (email);


--
-- Name: translator_employment translator_employment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_employment
    ADD CONSTRAINT translator_employment_pkey PRIMARY KEY (id);


--
-- Name: translator translator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator
    ADD CONSTRAINT translator_pkey PRIMARY KEY (id);


--
-- Name: translator translator_tlf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator
    ADD CONSTRAINT translator_tlf_key UNIQUE (tlf);


--
-- Name: task task_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id) ON DELETE CASCADE;


--
-- Name: task task_languageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_languageid_fkey FOREIGN KEY (languageid) REFERENCES public.language(id);


--
-- Name: task_review task_review_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_review
    ADD CONSTRAINT task_review_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id);


--
-- Name: task_review task_review_languageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_review
    ADD CONSTRAINT task_review_languageid_fkey FOREIGN KEY (languageid) REFERENCES public.language(id);


--
-- Name: task_review task_review_taskid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_review
    ADD CONSTRAINT task_review_taskid_fkey FOREIGN KEY (taskid) REFERENCES public.task(id) ON DELETE CASCADE;


--
-- Name: task_review task_review_translatorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_review
    ADD CONSTRAINT task_review_translatorid_fkey FOREIGN KEY (translatorid) REFERENCES public.translator(id);


--
-- Name: task task_translatorcompetenceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_translatorcompetenceid_fkey FOREIGN KEY (translatorcompetenceid) REFERENCES public.translator_competence(id);


--
-- Name: task task_translatorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_translatorid_fkey FOREIGN KEY (translatorid) REFERENCES public.translator(id);


--
-- Name: translator_competence translator_competence_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_competence
    ADD CONSTRAINT translator_competence_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.category(id);


--
-- Name: translator_competence translator_competence_languageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_competence
    ADD CONSTRAINT translator_competence_languageid_fkey FOREIGN KEY (languageid) REFERENCES public.language(id);


--
-- Name: translator_competence translator_competence_translatorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_competence
    ADD CONSTRAINT translator_competence_translatorid_fkey FOREIGN KEY (translatorid) REFERENCES public.translator(id);


--
-- Name: translator_employment translator_employment_translatorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translator_employment
    ADD CONSTRAINT translator_employment_translatorid_fkey FOREIGN KEY (translatorid) REFERENCES public.translator(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

