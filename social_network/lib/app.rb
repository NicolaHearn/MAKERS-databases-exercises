# file: app.rb

require_relative 'database_connection'
require_relative 'user_repository'
require_relative 'user'
require_relative 'post_repository'
require_relative 'post'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network_test')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title, content, views FROM posts;'
# result = DatabaseConnection.exec_params(sql, [])

# results = PostRepository.new
# puts results.all.each do |post|
#   puts "#{post.title}"
# end

def run_menu
  puts "Welcome to the posts manager!\n\nWhat would you like to do? (type 1 or 2)\n\n1 - List all users\n2 - List all posts"
  
  menu_choice = gets.chomp
  p menu_choice

  if menu_choice == "1"
    results = UserRepository.new
    results.all.each do |record|
      puts "#{record.id} - #{record.username} - #{record.email}"
    end
  elsif menu_choice == "2"
    post_results = PostRepository.new
    post_results.all.each do |post|
      puts "#{post.id} - #{post.title} - #{post.content} - #{post.views}"
    end
  end
end
