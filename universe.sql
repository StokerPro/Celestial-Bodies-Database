--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    unique_name text,
    size integer NOT NULL,
    age numeric NOT NULL,
    has_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    unique_name text,
    radius integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_inhabited boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    unique_name text,
    distance_from_star numeric NOT NULL,
    gravity numeric NOT NULL,
    has_water boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relation (
    relation_id integer NOT NULL,
    name character varying(255),
    unique_column character varying(255) NOT NULL,
    column1_name text,
    column2_name integer NOT NULL,
    column3_name boolean NOT NULL,
    num numeric
);


ALTER TABLE public.relation OWNER TO freecodecamp;

--
-- Name: relation_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.relation_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relation_relation_id_seq OWNER TO freecodecamp;

--
-- Name: relation_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.relation_relation_id_seq OWNED BY public.relation.relation_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    unique_name text,
    temperature integer NOT NULL,
    mass numeric NOT NULL,
    is_visible boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: relation relation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation ALTER COLUMN relation_id SET DEFAULT nextval('public.relation_relation_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'milky_way', 100000, 13000000000, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'andromeda', 120000, 14000000000, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'sombrero', 50000, 13000000000, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'triangulum', 40000, 13000000000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'whirlpool', 30000, 13000000000, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'pinwheel', 60000, 13000000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'moon', 1737, false, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'phobos', 11, false, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'deimos', 6, false, false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'europa', 1561, false, false, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'ganymede', 2634, false, false, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 'callisto', 2410, false, false, 3);
INSERT INTO public.moon VALUES (7, 'Titan', 'titan', 2575, true, false, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'enceladus', 252, true, false, 4);
INSERT INTO public.moon VALUES (10, 'Triton', 'triton', 2575, false, false, 4);
INSERT INTO public.moon VALUES (11, 'Charon', 'charon', 603, false, false, 7);
INSERT INTO public.moon VALUES (12, 'Phoebe', 'phoebe', 107, false, false, 8);
INSERT INTO public.moon VALUES (13, 'Oberon', 'oberon', 761, false, false, 9);
INSERT INTO public.moon VALUES (14, 'Miranda', 'miranda', 236, false, false, 10);
INSERT INTO public.moon VALUES (15, 'Nereid', 'nereid', 235, false, false, 12);
INSERT INTO public.moon VALUES (16, 'Luna', 'luna', 1737, false, false, 1);
INSERT INTO public.moon VALUES (17, 'Ceres', 'ceres', 476, false, false, 1);
INSERT INTO public.moon VALUES (18, 'Tethys', 'tethys', 531, false, false, 3);
INSERT INTO public.moon VALUES (19, 'Dione', 'dione', 561, false, false, 3);
INSERT INTO public.moon VALUES (20, 'Iapetus', 'iapetus', 737, false, false, 3);
INSERT INTO public.moon VALUES (21, 'Hyperion', 'hyperion', 135, false, false, 3);
INSERT INTO public.moon VALUES (22, 'Puck', 'puck', 78, false, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'earth', 149600000, 9.8, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'mars', 227900000, 3.7, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'jupiter', 778300000, 24.8, false, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 'saturn', 1429000000, 10.4, false, 2);
INSERT INTO public.planet VALUES (5, 'Neptune', 'neptune', 4498000000, 11.2, false, 3);
INSERT INTO public.planet VALUES (6, 'Uranus', 'uranus', 2871000000, 8.7, false, 4);
INSERT INTO public.planet VALUES (7, 'Pluto', 'pluto', 5906000, 0.6, false, 5);
INSERT INTO public.planet VALUES (8, 'Mercury', 'mercury', 57900000, 3.7, false, 5);
INSERT INTO public.planet VALUES (9, 'Venus', 'venus', 108200000, 8.9, false, 4);
INSERT INTO public.planet VALUES (10, 'Saturn V', 'saturn_v', 382800000, 11.2, false, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-16b', 'kepler_16b', 917500000, 1.68, false, 2);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 'wasp_12b', 374000000, 8.37, false, 3);


--
-- Data for Name: relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relation VALUES (1, 'hp', 'value1', 'data1', 1, true, 1);
INSERT INTO public.relation VALUES (2, 'ml', 'value2', 'data2', 2, true, 2);
INSERT INTO public.relation VALUES (3, 'pu', 'value3', 'data3', 3, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'sun', 5778, 1989000000000000000000000000000, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'sirius', 9940, 2.02, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'betelgeuse', 3500, 20, true, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 'rigel', 12100, 23, true, 2);
INSERT INTO public.star VALUES (5, 'Polaris', 'polaris', 6000, 5.4, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'vega', 9602, 2.1, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: relation_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.relation_relation_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name_key UNIQUE (unique_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name_key UNIQUE (unique_name);


--
-- Name: relation relation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (relation_id);


--
-- Name: relation relation_unique_column_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_unique_column_key UNIQUE (unique_column);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

