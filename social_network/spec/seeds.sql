-- DROP TABLE IF EXISTS "public"."users" CASCADE;
-- DROP TABLE IF EXISTS "public"."posts";
-- -- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- CREATE TABLE users (
--   "id" SERIAL PRIMARY KEY,
--   "username" text,
--   "email" text
-- );

-- -- Then the table with the foreign key.
-- CREATE TABLE posts (
--   "id" SERIAL PRIMARY KEY,
--   "title" text,
--   "content" text,
--   "views" int
-- );


TRUNCATE TABLE users RESTART IDENTITY;
TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO users (username, email) VALUES ('Harry Potter', 'harry94@gmail.com');
INSERT INTO users (username, email) VALUES ('Ariel', 'theMermaid@seamail.com');

INSERT INTO posts (title, content, views) VALUES ('spells for wicked kids', 'spell 1', 24);
INSERT INTO posts (title, content, views) VALUES ('spells for funny kids', 'spell 2, spell 3', 39);
INSERT INTO posts (title, content, views) VALUES ('How to be human', 'using a fork', 345);
INSERT INTO posts (title, content, views) VALUES ('How to speak so humans will listen', 'body language', 12);
