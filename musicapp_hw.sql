CREATE TABLE IF NOT EXISTS Genre(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Albums(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	year INTEGER CHECK(year > 1887)
);

CREATE TABLE IF NOT EXISTS Songs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	playngTime INTEGER NOT NULL,
	albumId INTEGER REFERENCES Albums(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS Vol(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	year INTEGER CHECK(year > 1887)
);

CREATE TABLE IF NOT EXISTS GenreArtists(
	artists_id INTEGER REFERENCES Artists(id),
	genre_id INTEGER REFERENCES Genre(id),
	CONSTRAINT pk_genreartists PRIMARY KEY (artists_id, genre_id)
);

CREATE TABLE IF NOT EXISTS ArtistAlbum(
	album_id INTEGER REFERENCES Albums(id),
	artist_id INTEGER REFERENCES Artists(id),
	CONSTRAINT pk_artistalbum PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS SongsVol(
	vol_id INTEGER REFERENCES Vol(id),
	song_id INTEGER REFERENCES Songs(id),
	CONSTRAINT pk_songsvol PRIMARY KEY (vol_id, song_id)
);