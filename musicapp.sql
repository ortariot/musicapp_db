-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: musicapp | type: DATABASE --
-- DROP DATABASE IF EXISTS musicapp;
CREATE DATABASE musicapp;
-- ddl-end --


-- object: public."Genre" | type: TABLE --
-- DROP TABLE IF EXISTS public."Genre" CASCADE;
CREATE TABLE public."Genre" (
	id serial NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT "Genre_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Genre" OWNER TO postgres;
-- ddl-end --

-- object: public."GenreArtists" | type: TABLE --
-- DROP TABLE IF EXISTS public."GenreArtists" CASCADE;
CREATE TABLE public."GenreArtists" (
	artist_id integer NOT NULL,
	genre_id integer NOT NULL,
	CONSTRAINT "GenreArtists_pk" PRIMARY KEY (artist_id,genre_id)

);
-- ddl-end --
ALTER TABLE public."GenreArtists" OWNER TO postgres;
-- ddl-end --

-- object: public."Artists" | type: TABLE --
-- DROP TABLE IF EXISTS public."Artists" CASCADE;
CREATE TABLE public."Artists" (
	id integer NOT NULL,
	name varchar(255) NOT NULL,
	country varchar(255),
	CONSTRAINT "Artists_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Artists" OWNER TO postgres;
-- ddl-end --

-- object: public."ArtistAlbum" | type: TABLE --
-- DROP TABLE IF EXISTS public."ArtistAlbum" CASCADE;
CREATE TABLE public."ArtistAlbum" (
	id_album integer NOT NULL,
	id_artist integer NOT NULL,
	CONSTRAINT "ArtistAlbum_pk" PRIMARY KEY (id_artist,id_album)

);
-- ddl-end --
ALTER TABLE public."ArtistAlbum" OWNER TO postgres;
-- ddl-end --

-- object: public."Albums" | type: TABLE --
-- DROP TABLE IF EXISTS public."Albums" CASCADE;
CREATE TABLE public."Albums" (
	id serial NOT NULL,
	name varchar(255) NOT NULL,
	year integer,
	CONSTRAINT "Albums_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Albums" OWNER TO postgres;
-- ddl-end --

-- object: public."Songs" | type: TABLE --
-- DROP TABLE IF EXISTS public."Songs" CASCADE;
CREATE TABLE public."Songs" (
	id serial NOT NULL,
	name varchar(255) NOT NULL,
	playng_time integer NOT NULL,
	almum_id integer,
	CONSTRAINT "Songs_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Songs" OWNER TO postgres;
-- ddl-end --

-- object: public."SongsVol" | type: TABLE --
-- DROP TABLE IF EXISTS public."SongsVol" CASCADE;
CREATE TABLE public."SongsVol" (
	id_vol integer NOT NULL,
	id_songs integer NOT NULL,
	CONSTRAINT "SongsVol_pk" PRIMARY KEY (id_vol,id_songs)

);
-- ddl-end --
ALTER TABLE public."SongsVol" OWNER TO postgres;
-- ddl-end --

-- object: public.vol | type: TABLE --
-- DROP TABLE IF EXISTS public.vol CASCADE;
CREATE TABLE public.vol (
	id serial NOT NULL,
	name varchar NOT NULL,
	year varchar,
	CONSTRAINT vol_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.vol OWNER TO postgres;
-- ddl-end --

-- object: ref_ga_g | type: CONSTRAINT --
-- ALTER TABLE public."GenreArtists" DROP CONSTRAINT IF EXISTS ref_ga_g CASCADE;
ALTER TABLE public."GenreArtists" ADD CONSTRAINT ref_ga_g FOREIGN KEY (genre_id)
REFERENCES public."Genre" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: ref_ga_art | type: CONSTRAINT --
-- ALTER TABLE public."GenreArtists" DROP CONSTRAINT IF EXISTS ref_ga_art CASCADE;
ALTER TABLE public."GenreArtists" ADD CONSTRAINT ref_ga_art FOREIGN KEY (artist_id)
REFERENCES public."Artists" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: ref_aa_art | type: CONSTRAINT --
-- ALTER TABLE public."ArtistAlbum" DROP CONSTRAINT IF EXISTS ref_aa_art CASCADE;
ALTER TABLE public."ArtistAlbum" ADD CONSTRAINT ref_aa_art FOREIGN KEY (id_artist)
REFERENCES public."Artists" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: ref_aa_al | type: CONSTRAINT --
-- ALTER TABLE public."ArtistAlbum" DROP CONSTRAINT IF EXISTS ref_aa_al CASCADE;
ALTER TABLE public."ArtistAlbum" ADD CONSTRAINT ref_aa_al FOREIGN KEY (id_album)
REFERENCES public."Albums" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: ref_s_al | type: CONSTRAINT --
-- ALTER TABLE public."Songs" DROP CONSTRAINT IF EXISTS ref_s_al CASCADE;
ALTER TABLE public."Songs" ADD CONSTRAINT ref_s_al FOREIGN KEY (almum_id)
REFERENCES public."Albums" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: ref_sv_s | type: CONSTRAINT --
-- ALTER TABLE public."SongsVol" DROP CONSTRAINT IF EXISTS ref_sv_s CASCADE;
ALTER TABLE public."SongsVol" ADD CONSTRAINT ref_sv_s FOREIGN KEY (id_songs)
REFERENCES public."Songs" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: ref_sv_v | type: CONSTRAINT --
-- ALTER TABLE public."SongsVol" DROP CONSTRAINT IF EXISTS ref_sv_v CASCADE;
ALTER TABLE public."SongsVol" ADD CONSTRAINT ref_sv_v FOREIGN KEY (id_vol)
REFERENCES public.vol (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


