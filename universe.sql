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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying NOT NULL,
    diameter integer NOT NULL,
    discovery_year integer,
    asteroid_id text NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_types character varying(60) NOT NULL,
    name_of_galaxy character varying(30),
    galaxy_id integer NOT NULL,
    name character varying(60),
    is_in_universe boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id character varying(60) NOT NULL,
    mean_radius numeric(5,3) NOT NULL,
    sidereal_period_d double precision,
    discovery_year integer,
    name character varying,
    constellation character varying(60)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    satelites integer NOT NULL,
    avg_orbital_speed_km_s double precision,
    surface_pressure_atm double precision,
    planet_id character varying(60) NOT NULL,
    name character varying(30),
    potential_life boolean,
    constellation character varying(60)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id character varying(60) NOT NULL,
    constellation character varying(60) NOT NULL,
    rotation_days integer,
    name character varying(30),
    is_in_solar_system boolean,
    name_of_galaxy text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Eros', 34, 1898, 'aa');
INSERT INTO public.asteroid VALUES ('Vesta', 525, 1807, 'paa');
INSERT INTO public.asteroid VALUES ('Ceres', 939, 1801, 'pbaa');
INSERT INTO public.asteroid VALUES ('Pallas', 582, 1802, 'pbcaa');
INSERT INTO public.asteroid VALUES ('Hygiea', 430, 1849, 'phhhha');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('spiral', 'andromeda', 1, NULL, NULL);
INSERT INTO public.galaxy VALUES ('elliptical', 'centaurus A', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES ('irregular', 'large magellanic cloud', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES ('barred spiral', 'whirlpool galaxy', 4, NULL, NULL);
INSERT INTO public.galaxy VALUES ('lenticular', 'sombrero galaxy', 5, NULL, NULL);
INSERT INTO public.galaxy VALUES ('new type', 'unknown', 6, 'no name', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Earth', 17.000, 27, 1610, 'Moon', 'Orion');
INSERT INTO public.moon VALUES ('Jupiter', 12.000, 0.66, 16, 'Io', 'Cygnus');
INSERT INTO public.moon VALUES ('Saturn', 76.000, 0.66, 16, 'Enceladus', 'Ursa Major');
INSERT INTO public.moon VALUES ('Mars', 11.000, 0.3, 96, 'Phobos', 'Scorpius');
INSERT INTO public.moon VALUES ('Neptune', 13.000, 5, 18, 'Triton', 'Aquarius');
INSERT INTO public.moon VALUES ('Pandora', 1.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Gaia', 2.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Lyra', 3.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Celestia', 4.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Nova', 5.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Aether', 6.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Orion', 7.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Zenith', 8.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Seraph', 9.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Stella', 11.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Aurora', 12.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Luna', 13.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Phoenix', 14.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Vega', 15.000, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Solara', 72.000, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 29.5, 1, 'Terrestrial', 'Mars', true, 'Scorpius');
INSERT INTO public.planet VALUES (79, 13.1, 1, 'Gas Giant', 'Jupiter', false, 'Orion');
INSERT INTO public.planet VALUES (1, 35.2, 0.1, 'Extra Terrestrial', 'Earth', true, 'Cygnus');
INSERT INTO public.planet VALUES (14, 5.4, 1.5, 'Ice Giant', 'Neptune', false, 'Aquarius');
INSERT INTO public.planet VALUES (19, 5.4, 1.5, 'Toxic', 'Venus', false, 'Ursa Major');
INSERT INTO public.planet VALUES (2, 25, 9, 'Rocky', 'Astra', true, 'Pegasus');
INSERT INTO public.planet VALUES (3, 12, 5, 'Oceanic', 'Aqua', false, 'Leo');
INSERT INTO public.planet VALUES (1, 30, 8, 'Arid', 'Vulcan', false, 'Gemini');
INSERT INTO public.planet VALUES (4, 18, 4, 'Desert', 'Sahara', false, 'Taurus');
INSERT INTO public.planet VALUES (1, 16, 7, 'Volcanic', 'Inferno', true, 'Sagittarius');
INSERT INTO public.planet VALUES (2, 22, 6, 'Jungle', 'Zephyr', false, 'Capricorn');
INSERT INTO public.planet VALUES (5, 14, 3, 'Barren', 'Obsidian', false, 'Virgo');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('G2V', 'Orion', 25, 'Betelgeuse', false, 'andromeda');
INSERT INTO public.star VALUES ('F5V', 'Cygnus', 22, 'Deneb', false, 'large magellanic cloud');
INSERT INTO public.star VALUES ('K3I', 'Ursa Major', 28, 'Alkaid', false, 'whirlpool galaxy');
INSERT INTO public.star VALUES ('O9V', 'Scorpius', 17, 'Antares', false, 'sombrero galaxy');
INSERT INTO public.star VALUES ('MOV', 'Aquarius', 34, 'Aldebaran', false, 'centaurus A');
INSERT INTO public.star VALUES ('OOO', 'Exclusive', 72, 'TUMAD', false, 'unknown');
INSERT INTO public.star VALUES ('AAA', 'Pegasus', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('BBB', 'Leo', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('CCC', 'Gemini', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('DDD', 'Taurus', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('EEE', 'Sagittarius', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('FFF', 'Capricorn', NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('GGG', 'Virgo', NULL, NULL, NULL, NULL);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_con; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_con UNIQUE (constellation);


--
-- Name: moon moon_constellation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constellation_key UNIQUE (constellation);


--
-- Name: star name_of_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_of_galaxy UNIQUE (name_of_galaxy);


--
-- Name: moon panet_parent; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT panet_parent PRIMARY KEY (moon_id);


--
-- Name: planet type_of_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT type_of_planet PRIMARY KEY (planet_id);


--
-- Name: star type_of_start; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT type_of_start PRIMARY KEY (star_id);


--
-- Name: galaxy uniqueness; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniqueness UNIQUE (name_of_galaxy);


--
-- Name: star uq2_product_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq2_product_name UNIQUE (constellation);


--
-- Name: planet uq_constellation; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_constellation UNIQUE (constellation);


--
-- Name: moon moon_constellation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constellation_fkey FOREIGN KEY (constellation) REFERENCES public.planet(constellation);


--
-- Name: planet planet_constellation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constellation_fkey FOREIGN KEY (constellation) REFERENCES public.star(constellation);


--
-- Name: star star_name_of_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_of_galaxy_fkey FOREIGN KEY (name_of_galaxy) REFERENCES public.galaxy(name_of_galaxy);


--
-- PostgreSQL database dump complete
--

