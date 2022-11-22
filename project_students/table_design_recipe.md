# Single Table Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As school administrator,
So I can organise the students and classes,
I want to keep a list of student names.

As a school administrator, 
So that I can organise the students and classes, 
I want to keep a list of the student cohorts
```

```
Nouns:

students, name, cohort_name
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| student               | name, cohort_name

Name of the table (always plural): `students` 

Column names: `name`, `cohort_name`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

id: SERIAL
name: text
cohort_name: text
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: students_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_name int
);
```

## 5. Create the table.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```
