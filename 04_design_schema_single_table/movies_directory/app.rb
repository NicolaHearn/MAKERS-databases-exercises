# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/movie_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('movies')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title FROM movies;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end

movie_repo = MovieRepository.new
movie = movie_repo.find(2)

puts movie.title