CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES author(id),
    label_id INT REFERENCES labels(id),
    publish_date DATE,
    archived BOOLEAN
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(250),
    last_name VARCHAR(250)
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES author(id),
    label_id INT REFERENCES labels(id),
    publish_date DATE,
    archived BOOLEAN
);
