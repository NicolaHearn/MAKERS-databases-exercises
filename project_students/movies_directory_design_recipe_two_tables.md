1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a film lover
So I can remember the movies I have watched
I want to see a list of my movie names.

As a film lover
So I can categorise my movies
I want to see a list of the movie genres.

As a film lover
So I can see more details about the movies
I want to see the release_years.


Nouns:
movies, title, release_year, genre

2. Infer the Table Names and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Table 1
Record	Properties
movie   id, title, genre, release_year
Name of the table (always plural): movies

Column names: title, genre, release_year

Table 2
Record	Properties
genre   id, genre_name, movie_title

Column names: genre_name, movie_name


3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:
Table 1 - movies
id: SERIAL
"title" text,
"release_year" text,
"genre" text

Table 2 - genres
id: SERIAL
"genre_name" text,
"movie_name" text,

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one movies have many genres? (No)
Can one genres have many movies? (Yes)
You'll then be able to say that:

Genres has many movies
And on the other side, movie belongs to genre
In that case, the foreign key is in the table movies
Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one genre have many movies? YES
2. Can one movie have many genres? NO

-> Therefore,
-> A genre HAS MANY movies
-> A movie BELONGS TO an genre

-> Therefore, the foreign key is on the movies table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).


5. Write the SQL.
-- EXAMPLE
-- file: movies_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE genres (
  "id" SERIAL PRIMARY KEY,
  "genre_name" text,
  "movie_name" text
);

CREATE TABLE movies (
    "id" SERIAL PRIMARY KEY,
    "title" text,
    "release_year" text,
    "genre" text,
    "genre_id" int,
    constraint fk_genre foreign key(genre_id)
    references genres(id)
    on delete cascade
);

5. Create the table.
psql -h 127.0.0.1 student_directory_1 < students_table.sql