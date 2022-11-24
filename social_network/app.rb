# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/user'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network_test')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, username FROM users;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end

def run_menu
  puts "Welcome to the posts manager!\n\nWhat would you like to do? (type 1 or 2)\n\n1 - List all users\n2 - List all posts"
  
  menu_choice = gets

  if 1
    user_repo = UserRepository.new
    puts user_repo.all
  end
end

run_menu