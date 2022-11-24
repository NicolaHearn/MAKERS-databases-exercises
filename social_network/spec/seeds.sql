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
--   "views" int,
--   "user_id" int,
--   constraint fk_user foreign key(user_id)
--     references users(id)
--     on delete cascade
-- );

TRUNCATE TABLE posts RESTART IDENTITY;
TRUNCATE TABLE users RESTART IDENTITY cascade; 

INSERT INTO users (username, email) VALUES ('Harry Potter', 'harry94@gmail.com');
INSERT INTO users (username, email) VALUES ('Ariel', 'theMermaid@seamail.com');

INSERT INTO posts (title, content, views, user_id) VALUES ('spells for wicked kids', 'spell 1', 24, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('spells for funny kids', 'spell 2, spell 3', 39, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('How to be human', 'using a fork', 345, 2);
INSERT INTO posts (title, content, views, user_id) VALUES ('How to speak so humans will listen', 'body language', 12, 2);
