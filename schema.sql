CREATE TABLE items (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT,
  author_id INT,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  labels_id INT,
  FOREIGN KEY (labels_id) REFERENCES labels(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE books (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(50) NOT NULL,
  cover_state VARCHAR(50) NOT NULL,
  items_id INT,
  FOREIGN KEY (items_id) REFERENCES items(id)
);

CREATE TABLE labels (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);

CREATE TABLE music_albums (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  date_published DATE NOT NULL,
  items_id INT,
  FOREIGN KEY (items_id) REFERENCES items(id)
);

CREATE TABLE genres (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE author (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);

CREATE TABLE game (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  multiplayer VARCHAR(100) NOT NULL,
  last_played_at DATE NOT NULL,
  items_id INT,
  FOREIGN KEY (items_id) REFERENCES items(id)
);

CREATE INDEX game_items_asc ON game (items_id)
CREATE INDEX music_albums_items_asc ON music_albums (items_id)
CREATE INDEX books_items_asc ON books (items_id)
CREATE INDEX items_author_asc ON items (author_id)
CREATE INDEX items_genre_asc ON items (genre_id)
CREATE INDEX items_labels_asc ON items (labels_id)
