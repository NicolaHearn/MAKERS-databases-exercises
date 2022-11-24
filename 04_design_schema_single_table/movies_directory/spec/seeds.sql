DROP TABLE IF EXISTS "public"."movies";
DROP TABLE IF EXISTS "public"."genres";

CREATE TABLE genres (
  "id" SERIAL PRIMARY KEY,
  "genre_name" text
);

CREATE TABLE movies (
    "id" SERIAL PRIMARY KEY,
    "title" text,
    "release_year" text,
    "genre_id" int,
    constraint fk_genre foreign key(genre_id)
    references genres(id)
    on delete cascade
);




TRUNCATE TABLE movies RESTART IDENTITY; 

INSERT INTO genres (genre_name) VALUES ('Sci-fi');
INSERT INTO genres (genre_name) VALUES ('Fantasy');
INSERT INTO genres (genre_name) VALUES ('Drama');

INSERT INTO movies (title, release_year, genre_id) VALUES ('Lord of the Rings', '2001', 1);
INSERT INTO movies (title, release_year, genre_id) VALUES ('The Matrix', '1999', 2);