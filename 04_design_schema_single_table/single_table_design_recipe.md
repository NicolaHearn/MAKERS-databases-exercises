Students Single Table Design Recipe


1. Extract nouns from the user stories or specification

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

Nouns:

students, names, cohort_name

2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties
student	name, cohort_name
Name of the table (always plural): students

Column names: name, cohort_name

3. Decide the column types.

# EXAMPLE:

id: SERIAL
name: text
cohort_name: text

4. Write the SQL.

-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_name text
);

5. Create the table.

psql -h 127.0.0.1 database_name < albums_table.sql