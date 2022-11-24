# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/movie_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('movies')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title FROM movies;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
def run_menu
  puts "Welcome to the music library manager!\n\nWhat would you like to do? (type 1 or 2)\n\n1 - List all movies\n2 - List all genres"
  
  menu_choice = gets

  if 1
    movie_repo = MovieRepository.new
    puts movie_repo.all
  end
end


movie_repo = MovieRepository.new
movie = movie_repo.find(2)

puts movie.title
puts movie_repo.all

# run_menu