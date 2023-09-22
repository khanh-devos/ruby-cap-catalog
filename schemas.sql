CREATE DATABASE ruby_catalog;

CREATE TABLE items (
	id SERIAL PRIMARY KEY,
    item_type VARCHAR(250),
    publish_date date,
	archived BOOLEAN,
    genre_id integer REFERENCES genres(id),
	author_id integer REFERENCES authors(id),
	label_id integer REFERENCES labels(id),
);


CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(250),
    last_name VARCHAR(250),
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250)
    multiplayer BOOLEAN,
    last_played_at DATE,
    item_id INT REFERENCES items(id) ON DELETE CASCADE
);

-- =====================
CREATE TABLE labels (
    id SERIAL,
    title VARCHAR(250),
    color VARCHAR(50),
    PRIMARY KEY (id, title)
)

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250),
    cover_state BOOLEAN,
    publisher VARCHAR(250),
    item_id INT REFERENCES items(id) ON DELETE CASCADE
)


-- ===========================
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
)

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250),
    on_spotify BOOLEAN,
    item_id INT REFERENCES items(id) ON DELETE CASCADE
)

