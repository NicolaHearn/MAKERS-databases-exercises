social Network Model and Repository Classes Design Recipe

Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Define the tables

Table 1: users

Columns:
id | username | email

Table 2: posts

Columns: 
id | title | content | views | user_id


2. Create Test SQL seeds

TRUNCATE TABLE users RESTART IDENTITY; 
TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO users (username, email) VALUES ('Harry Potter', 'harry94@gmail.com');
INSERT INTO users (username, email) VALUES ('Ariel', 'theMermaid@seamail.com');

INSERT INTO posts (title, content, views, user_id) VALUES ('spells for wicked kids', 'spell 1', 23, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('spells for funny kids', 'spell 2, spell 3', 34, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('How to be human', 'using a fork', 234, 2);
INSERT INTO posts (title, content, views, user_id) VALUES ('How to speak so humans will listen', 'body language', 567,2);


psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql



3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

Table name: users

Model classes
(in lib/user.rb)
class User
end

(in lib/post.rb)
class Post
end

Repository classes
(in lib/user_repository.rb)
class UserRepository
end

(in lib/post_repository.rb)
class PostRepository
end

4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

Table name: user

Model class
in lib/user.rb)

class User
  attr_accessor :id, :username, :email
end

class Post
  attr_accessor :id, :title, :content, :views, :user_id
end

5. Define the Repository Class interface


Table name: users

Repository class
(in lib/user_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:

    result_set = DatabaseConnection.exec_params('SELECT id, username, email FROM users;', [])
    
    users = []

    result_set.each do |person|
      user = User.new
      user.id = person['id']
      user.username = person['username']
      user.email = person['email']
      
      users << user
    end

    return users
  end

  def find(id)
    sql = 'SELECT id, username, email FROM users WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)

    user = User.new
    user.id = result['id']
    user.username = result['username']
    user.email = result['email']

    return user

  end

  def create(user)
    sql = 'INSERT INTO user (username, email) VALUES ($1, $2);'
    params = [user.username, user.email]

    result_set = DatabaseConnection.exec_params(sql, params)
  end

  def delete(user)
    sql = 'DELETE FROM users WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end

end

class PostRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:

    result_set = DatabaseConnection.exec_params('SELECT id, title, content, views, user_id FROM posts;', [])
    
    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.views = record['views']
      post.user_id = record[user_id]

      posts << post
    end

    return posts
  end

  def find(id)
    sql = 'SELECT id, title, content, views, user_id FROM users WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)

    post = Post.new
    post.id = record['id']
    post.title = record['title']
    post.content = record['content']
    post.views = record['views']
    post.user_id = record[user_id]

    return post

  end

  def create(post)
    sql = 'INSERT INTO user (title, content, views) VALUES ($1, $2, $3, $4);'
    params = [post.title, post.content, post.views]

    result_set = DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end

end
6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  2

users[0].id # =>  1
users[0].username # =>  'Harry Potter'
users[0].email# =>  'harry94@gmail.com'

users[1].id # =>  2
users[1].username # =>  'Ariel'
users[1].email # =>  'theMermaid@seamail.com'

# 2 find a user by id

repo = UserRepository.new

users = repo.find(2)

users[0].id # =>  2
users[0].username # =>  'Ariel'
users[0].email # =>  'theMermaid@seamail.com'

# 3 create a new user

repo = UserRepository.new

new_user = User.new
new_user.username = 'Postman Pat'
new_user.email = 'patandcat@hillsmail.com'

query = repo.create(new_user)

users = repo.all

users.length => 3

# 4 delete a user

repo = UserRepository.new

repo.delete(1)

users = repo.all

users.length => 1


7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BooksRepository do
  before(:each) do 
    reset_books_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.