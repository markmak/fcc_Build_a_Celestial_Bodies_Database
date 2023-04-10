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
-- Name: artificial_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.artificial_object (
    artificial_object_id integer NOT NULL,
    planet_id integer,
    moon_id integer,
    name character varying(35) NOT NULL,
    landing_date date NOT NULL
);


ALTER TABLE public.artificial_object OWNER TO freecodecamp;

--
-- Name: artificial_object_artificial_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.artificial_object_artificial_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artificial_object_artificial_object_id_seq OWNER TO freecodecamp;

--
-- Name: artificial_object_artificial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.artificial_object_artificial_object_id_seq OWNED BY public.artificial_object.artificial_object_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth_in_millions_of_light_years numeric(4,3) NOT NULL,
    type character varying(10),
    diameter_in_light_year integer,
    mass_in_solar_mass bigint,
    number_of_star bigint
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
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    discovery_date date,
    discovery_by character varying(20)
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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_moon boolean,
    num_of_moons integer,
    mass_in_earth_mass numeric(6,3),
    potentially_habitable boolean,
    description text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    constellation character varying(20),
    mass_in_solar_mass numeric(5,3)
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
-- Name: artificial_object artificial_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_object ALTER COLUMN artificial_object_id SET DEFAULT nextval('public.artificial_object_artificial_object_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: artificial_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.artificial_object VALUES (1, 1, NULL, 'MESSENGER', '2015-04-30');
INSERT INTO public.artificial_object VALUES (2, NULL, 11, 'Huygens lander', '2005-01-14');
INSERT INTO public.artificial_object VALUES (3, 2, NULL, 'Venera 3', '1966-03-01');
INSERT INTO public.artificial_object VALUES (4, 2, NULL, 'Pioneer Venus Multiprobe', '1978-12-09');
INSERT INTO public.artificial_object VALUES (5, 4, NULL, 'Mars 2 lander', '1971-11-27');
INSERT INTO public.artificial_object VALUES (6, 4, NULL, 'Viking 1 lander', '1976-07-20');
INSERT INTO public.artificial_object VALUES (7, 5, NULL, 'Galileo atmospheric probe', '1995-12-07');
INSERT INTO public.artificial_object VALUES (8, 6, NULL, 'Cassini orbiter', '2017-09-15');
INSERT INTO public.artificial_object VALUES (9, NULL, 3, 'Luna 2', '1959-09-13');
INSERT INTO public.artificial_object VALUES (10, NULL, 3, 'Ranger 4', '1962-04-26');
INSERT INTO public.artificial_object VALUES (11, NULL, 3, 'Hiten', '1993-04-10');
INSERT INTO public.artificial_object VALUES (12, NULL, 3, 'Chandrayaan-1 Moon Impact Probe', '2008-11-14');
INSERT INTO public.artificial_object VALUES (13, NULL, 3, 'Chang''e 1', '2009-03-01');
INSERT INTO public.artificial_object VALUES (14, NULL, 3, 'Beresheet', '2019-04-11');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.027, 'SBbc', 87400, 1150000000000, 250000000000);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Overdensity', 0.025, 'Irr', NULL, NULL, 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Segue 1', 0.075, 'dSph', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Spheroidal Galaxy', 0.078, 'dSph', 10000, 400000000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Ursa Major II Dwarf', 0.098, 'dSph', 1800, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Segue 2', 0.114, 'dSph', 220, 550000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', NULL, NULL);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', '1877-08-18', 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', '1877-08-12', 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 5, 'Io', '1610-01-08', 'Galileo Galilei');
INSERT INTO public.moon VALUES (5, 5, 'Europa', '1610-01-08', 'Galileo Galilei');
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', '1610-01-07', 'Galileo Galilei');
INSERT INTO public.moon VALUES (7, 6, 'Mimas', '1789-09-17', 'William Herschel');
INSERT INTO public.moon VALUES (8, 6, 'Tethys', '1684-03-11', 'G. D. Cassini');
INSERT INTO public.moon VALUES (9, 6, 'Rhea', '1672-12-23', 'G. D. Cassini');
INSERT INTO public.moon VALUES (10, 6, 'Dione', '1684-03-30', 'G. D. Cassini');
INSERT INTO public.moon VALUES (11, 6, 'Titan', '1655-03-25', 'Christiaan Huygens');
INSERT INTO public.moon VALUES (12, 7, 'Ariel', '1851-10-24', 'William Lassell');
INSERT INTO public.moon VALUES (13, 7, 'Miranda', '1948-02-16', 'Gerard P. Kuiper');
INSERT INTO public.moon VALUES (14, 7, 'Oberon', '1787-01-11', 'William Herschel');
INSERT INTO public.moon VALUES (15, 7, 'Titania', '1787-01-11', 'William Herschel');
INSERT INTO public.moon VALUES (16, 7, 'Umbriel', '1851-10-24', 'William Lassell');
INSERT INTO public.moon VALUES (17, 8, 'Hippocamp', '2013-07-01', 'M. R. Showalter');
INSERT INTO public.moon VALUES (18, 8, 'Nereid', '1949-05-01', 'Gerard P. Kuiper');
INSERT INTO public.moon VALUES (19, 8, 'Proteus', '1989-06-16', 'Stephen P. Synnott');
INSERT INTO public.moon VALUES (20, 8, 'Trition', '1846-10-10', 'William Lassell');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 3, 'Mercury', false, 0, 0.055, false, 'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun''s planets.');
INSERT INTO public.planet VALUES (2, 3, 'Venus', false, 0, 0.815, false, 'Venus is the second planet from the Sun. It is sometimes called Earth''s "sister" or "twin" planet as it is almost as large and has a similar composition.');
INSERT INTO public.planet VALUES (3, 3, 'Earth', true, 1, 1.000, true, 'Earth is the third planet from the Sun and the only place known in the universe where life has originated and found habitability.');
INSERT INTO public.planet VALUES (4, 3, 'Mars', true, 2, 0.107, true, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, larger only than Mercury.');
INSERT INTO public.planet VALUES (5, 3, 'Jupiter', true, 80, 317.800, false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times of all the other planets in the Solar System combined.');
INSERT INTO public.planet VALUES (6, 3, 'Saturn', true, 83, 95.159, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth');
INSERT INTO public.planet VALUES (7, 3, 'Uranus', true, 27, 14.536, false, 'Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.');
INSERT INTO public.planet VALUES (8, 3, 'Neptune', true, 14, 17.147, false, 'Neptune is the eighth planet from the Sun and the farthest known planet in the Solar System. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet.');
INSERT INTO public.planet VALUES (9, 4, 'Proxima Centauri b', false, 0, 1.070, true, 'Proxima Centauri b is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of the larger triple star system Alpha Centauri.');
INSERT INTO public.planet VALUES (10, 4, 'Proxima Centauri d', NULL, NULL, 0.810, true, 'Proxima Centauri d is an exoplanet orbiting the red dwarf star Proxima Centauri, the closest star to the Sun and part of the Alpha Centauri triple star system.');
INSERT INTO public.planet VALUES (11, 4, 'Proxima Centauri c', NULL, NULL, 7.000, true, 'Proxima Centauri c is a controversial exoplanet candidate claimed to be orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of a triple star system.');
INSERT INTO public.planet VALUES (12, 6, 'Lacaille 9352 c', NULL, NULL, 7.600, true, 'Lacaille 9352 c is an exoplanet announced in 2020 and located 10.74 light years away, in the constellation of Piscis Austrinus.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 'VY Canis Majoris', 'Canis Major', 21.000);
INSERT INTO public.star VALUES (2, 1, 'Stephenson 2 DFK 1', 'Scutum', NULL);
INSERT INTO public.star VALUES (4, 1, 'Proxima Centauri', 'Centaurus', 0.122);
INSERT INTO public.star VALUES (5, 1, 'Lalande 21185', 'Ursa Major', 0.389);
INSERT INTO public.star VALUES (6, 1, 'Lacaille 9352', 'Piscis Austrinus', 0.479);
INSERT INTO public.star VALUES (3, 1, 'Sun', NULL, 1.000);


--
-- Name: artificial_object_artificial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.artificial_object_artificial_object_id_seq', 1, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: artificial_object artificial_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_object
    ADD CONSTRAINT artificial_object_name_key UNIQUE (name);


--
-- Name: artificial_object artificial_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_object
    ADD CONSTRAINT artificial_object_pkey PRIMARY KEY (artificial_object_id);


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
-- Name: artificial_object artificial_object_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_object
    ADD CONSTRAINT artificial_object_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: artificial_object artificial_object_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_object
    ADD CONSTRAINT artificial_object_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

