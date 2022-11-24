1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.

Nouns:

user_account, email_address, username, post, post_title, post_content, views

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Table 1

Record	Properties
users	username, email
Name of the first table (always plural): users

Column names: username, email


Table 2
Record  Properties
post    title, content, views
Name of the second table (always plural): posts

Column names: title, content, views


3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: users
"id" SERIAL PRIMARY KEY,
"username" text,
"email" text,

Table: posts
"id" SERIAL PRIMARY KEY,
"title" text,
"content" text,
"views" int

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)
You'll then be able to say that:

[A] has many [B]
And on the other side, [B] belongs to [A]
In that case, the foreign key is in the table [B]
Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one user have many posts? YES
2. Can one post have many users? NO

-> Therefore,
-> A user HAS MANY posts
-> A post BELONGS TO a user

-> Therefore, the foreign key is on the posts table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  "id" SERIAL PRIMARY KEY,
  "username" text,
  "email" text,
);

-- Then the table with the foreign key.
CREATE TABLE posts (
  "id" SERIAL PRIMARY KEY,
  "title" text,
  "content" text,
  "views" int,
  "user_id" int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

5. Create the tables.
psql -h 127.0.0.1 database_name < seeds.sql