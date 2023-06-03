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
    name text,
    diameter integer,
    discovery_year integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_types character varying(60) NOT NULL,
    name_of_galaxy character varying(30),
    galaxy_id integer,
    name character varying(60),
    is_in_universe boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    parent character varying(60) NOT NULL,
    mean_radius numeric(5,3),
    sidereal_period_d double precision,
    discovery_year integer,
    name text,
    constellation character varying(60)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    satelites integer,
    avg_orbital_speed_km_s double precision,
    surface_pressure_atm double precision,
    type character varying(60) NOT NULL,
    name character varying(30),
    potential_life boolean,
    constellation character varying(60)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    type character varying(60) NOT NULL,
    constellation character varying(60),
    rotation_days integer,
    name character varying(30),
    is_in_solar_system boolean,
    name_of_galaxy text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Eros', 34, 1898);
INSERT INTO public.asteroid VALUES ('Vesta', 525, 1807);
INSERT INTO public.asteroid VALUES ('Ceres', 939, 1801);
INSERT INTO public.asteroid VALUES ('Pallas', 582, 1802);
INSERT INTO public.asteroid VALUES ('Hygiea', 430, 1849);


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


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 29.5, 1, 'Terrestrial', 'Mars', true, 'Scorpius');
INSERT INTO public.planet VALUES (79, 13.1, 1, 'Gas Giant', 'Jupiter', false, 'Orion');
INSERT INTO public.planet VALUES (1, 35.2, 0.1, 'Extra Terrestrial', 'Earth', true, 'Cygnus');
INSERT INTO public.planet VALUES (14, 5.4, 1.5, 'Ice Giant', 'Neptune', false, 'Aquarius');
INSERT INTO public.planet VALUES (19, 5.4, 1.5, 'Toxic', 'Venus', false, 'Ursa Major');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('G2V', 'Orion', 25, 'Betelgeuse', false, 'andromeda');
INSERT INTO public.star VALUES ('F5V', 'Cygnus', 22, 'Deneb', false, 'large magellanic cloud');
INSERT INTO public.star VALUES ('K3I', 'Ursa Major', 28, 'Alkaid', false, 'whirlpool galaxy');
INSERT INTO public.star VALUES ('O9V', 'Scorpius', 17, 'Antares', false, 'sombrero galaxy');
INSERT INTO public.star VALUES ('MOV', 'Aquarius', 34, 'Aldebaran', false, 'centaurus A');
INSERT INTO public.star VALUES ('OOO', 'Exclusive', 72, 'TUMAD', false, 'unknown');


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
    ADD CONSTRAINT panet_parent PRIMARY KEY (parent);


--
-- Name: planet type_of_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT type_of_planet PRIMARY KEY (type);


--
-- Name: star type_of_start; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT type_of_start PRIMARY KEY (type);


--
-- Name: galaxy types_of_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT types_of_galaxy PRIMARY KEY (galaxy_types);


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

