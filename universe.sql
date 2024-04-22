--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying NOT NULL,
    size integer,
    type text,
    has_black_hole boolean NOT NULL,
    num_stars integer
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
    name character varying NOT NULL,
    planet_id integer,
    diameter integer,
    orbital_period numeric,
    is_inhabited boolean NOT NULL,
    surface_type text
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
    name character varying NOT NULL,
    star_id integer,
    type character varying,
    num_moons integer,
    has_atmosphere boolean NOT NULL,
    temperature integer
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    distance_from_planet numeric,
    has_atmosphere boolean NOT NULL,
    is_natural boolean NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    spectral_type character varying,
    mass numeric,
    is_main_sequence boolean NOT NULL,
    age integer
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, 'spiral', true, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1200000, 'spiral', true, 250);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 500000, 'spiral', false, 100);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 1500000, 'elliptical', true, 300);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 800000, 'spiral', false, 150);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 700000, 'spiral', false, 180);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 27.3, false, 'rocky');
INSERT INTO public.moon VALUES (2, 'Deimos', 2, 12, 1.3, false, 'rocky');
INSERT INTO public.moon VALUES (3, 'Phobos', 2, 22, 0.3, false, 'rocky');
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3138, 3.6, false, 'icy');
INSERT INTO public.moon VALUES (5, 'Io', 3, 3637, 1.8, false, 'volcanic');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262, 7.2, false, 'icy');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, 16.7, false, 'icy');
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150, 15.9, false, 'icy');
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 504, 1.4, false, 'icy');
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 396, 0.9, false, 'rocky');
INSERT INTO public.moon VALUES (11, 'Triton', 7, 2706, 5.9, false, 'icy');
INSERT INTO public.moon VALUES (12, 'Charon', 8, 1208, 6.4, false, 'rocky');
INSERT INTO public.moon VALUES (13, 'Endor', 9, 490, 0.8, false, 'forest');
INSERT INTO public.moon VALUES (14, 'Hoth', 10, 720, 2.2, false, 'ice');
INSERT INTO public.moon VALUES (15, 'Yavin 4', 11, 1020, 0.8, true, 'jungle');
INSERT INTO public.moon VALUES (16, 'Mustafar', 12, 420, 0.3, false, 'volcanic');
INSERT INTO public.moon VALUES (17, 'Dagobah', 12, 800, 0.4, false, 'swamp');
INSERT INTO public.moon VALUES (18, 'Kashyyyk', 12, 1140, 1.9, true, 'forest');
INSERT INTO public.moon VALUES (19, 'Naboo', 12, 1210, 0.3, true, 'lake');
INSERT INTO public.moon VALUES (21, 'Hawen', 12, 2014, 0.7, true, 'ice');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'terrestrial', 1, true, 15);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'terrestrial', 2, true, -65);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'terrestrial', 0, true, 464);
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, 'gas giant', 79, false, -145);
INSERT INTO public.planet VALUES (5, 'Saturn', 2, 'gas giant', 82, false, -178);
INSERT INTO public.planet VALUES (6, 'Uranus', 2, 'ice giant', 27, false, -216);
INSERT INTO public.planet VALUES (7, 'Neptune', 2, 'ice giant', 14, false, -214);
INSERT INTO public.planet VALUES (8, 'Pluto', 2, 'dwarf', 5, false, -229);
INSERT INTO public.planet VALUES (9, 'Mercury', 3, 'terrestrial', 0, true, 427);
INSERT INTO public.planet VALUES (10, 'Tatooine', 4, 'desert', 3, true, 33);
INSERT INTO public.planet VALUES (11, 'Alderaan', 4, 'terrestrial', 1, true, 20);
INSERT INTO public.planet VALUES (12, 'Coruscant', 4, 'city', 4, true, 29);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Phobos', 2, 9380, false, true);
INSERT INTO public.satellite VALUES (2, 'Deimos', 2, 23460, false, true);
INSERT INTO public.satellite VALUES (3, 'Europa', 3, 670900, false, true);
INSERT INTO public.satellite VALUES (4, 'Io', 3, 421700, false, true);
INSERT INTO public.satellite VALUES (5, 'Ganymede', 3, 1070000, false, true);
INSERT INTO public.satellite VALUES (6, 'Callisto', 3, 1883000, false, true);
INSERT INTO public.satellite VALUES (7, 'Titan', 4, 1221860, true, true);
INSERT INTO public.satellite VALUES (8, 'Enceladus', 5, 237948, true, true);
INSERT INTO public.satellite VALUES (9, 'Mimas', 5, 185539, true, true);
INSERT INTO public.satellite VALUES (10, 'Triton', 7, 354760, true, true);
INSERT INTO public.satellite VALUES (11, 'Charon', 8, 19571, true, true);
INSERT INTO public.satellite VALUES (12, 'Endor Moon', 9, 125100, true, true);
INSERT INTO public.satellite VALUES (13, 'Hoth Moon', 10, 1870, false, true);
INSERT INTO public.satellite VALUES (14, 'Yavin 4 Moon', 11, 27195, true, true);
INSERT INTO public.satellite VALUES (15, 'Mustafar Moon', 12, 328, false, true);
INSERT INTO public.satellite VALUES (16, 'Dagobah Moon', 12, 237, false, true);
INSERT INTO public.satellite VALUES (17, 'Kashyyyk Moon', 12, 610, true, true);
INSERT INTO public.satellite VALUES (18, 'Naboo Moon', 12, 156, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1989000000000000000000000000000, true, 5);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G2V', 2200000000000000000000000000000, true, 6);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 'K0V', 1700000000000000000000000000000, true, 6);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'A1V', 2020000000000000000000000000000, true, 0);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'M5.5Ve', 123000000000000000000000000000, true, 5);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 2, 'M1-M2Ia-Iab', 77000000000000000000000000000000, true, 9);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

