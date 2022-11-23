Students Single Table Design Recipe


1. Extract nouns from the user stories or specification

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' titles.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' genres.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' release year.

Nouns:

movies, titles, genres, release years.

2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties
movie	title, genre, release_year
Name of the table (always plural): movies

Column names: title, genre, release_year

3. Decide the column types.

# EXAMPLE:

id: SERIAL
title: text
genre: text
release_year: text

4. Write the SQL.

-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  genre text,
  release_year text
);

5. Create the table.

psql -h 127.0.0.1 database_name < albums_table.sql